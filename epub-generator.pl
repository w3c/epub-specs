use strict;
use warnings;

use File::Copy;
use File::Copy::Recursive qw(dircopy);
use File::Find;
use File::Path;
use POSIX qw(strftime);

my $epub_version = '31';

my %core_media = (
    'css' => 'text/css',
    'html' => 'application/xhtml+xml',
    'jpg' => 'image/jpeg',
    'jpeg' => 'image/jpeg',
    'js' => 'text/javascript',
    'png' => 'image/png',
    'gif' => 'image/gif',
    'xhtml' => 'application/xhtml+xml',
    'license' => 'text/plain'
);

my %alt_media = (
    'txt' => 'text/plain'
);

my %strip = (
    'gz' => 'application/gzip',
    'zip' => 'application/zip',
    'nvdl' => 'application/xml',
    'rnc' => 'application/rnc',
    'rng' => 'application/xml',
    'sch' => 'application/xml',
    'xml' => 'application/xml'
);

my @spec_order = (
    'epub-spec',
    'epub-overview',
    'epub-publications',
    'epub-mediaoverlays',
    'epub-ocf',
    'epub-changes',
    'epub-cfi',
    'altss-tags',
    'epub-indexes',
    'epub-dict',
    'epub-multiple-renditions',
    'epub-region-nav',
    'epub-previews',
    'epub-package-metadata',
    'epub-vocab-structure',
    'epub-vocab-magazine'
);

my %spec_wanted = map { $_ => 1 } @spec_order;

my @files;
my $package = 'package.opf';
my $nav = 'nav.xhtml';

my $build_dir = './build/';
my $skeleton_dir = './src/epub-skeleton/';
my $epub_dir = './temp/epub' . $epub_version . '/';
my $content_dir = $epub_dir . 'EPUB/';

prep();

chdir($content_dir);

find(\&specs, '.');

generate_opf();
generate_nav();

chdir('../../../');

pack_epub();



sub prep {
    if (-e $epub_dir) {
        rmtree($epub_dir);
    }
    dircopy($skeleton_dir,$epub_dir) or die("$!\n");
    dircopy($build_dir,$content_dir) or die("$!\n");
    rmtree($content_dir . $epub_version . '/schema');
    rmtree($content_dir . 'renditions/multiple/schema');
    rmtree($content_dir . 'renditions/region-nav/schema');
    rmtree($content_dir . 'dict/schema');
    rmtree($content_dir . 'idx/schema');
}

sub specs {
    if ($_ eq '.htaccess') {
        unlink $_ or die "Failed to remove .htaccess file $File::Find::name: $!\n";
        return; 
    }
    
    return if $_ eq 'unsupported.xhtml';
    
    # return if no dots in path - for some reason -d and -f aren't detecting directories - but allow LICENSE file
    return if $_ !~ /\./ and $_ ne 'LICENSE';
    
    # don't pick up root directory
    return if $_ =~ /^\.+$/;
    
    # remove the various gz/zips that get generated
    (my $ext = $_) =~ s/^.*\.//;
    $ext = lc($ext);
    if ($strip{$ext}) { print "Removing unwanted media type $File::Find::name.\n"; unlink $_; return; }
    
    # have to strip ./ from start of paths for the manifest otherwise linking fails
    (my $fixed_path = $File::Find::name) =~ s#^\./##;
    
    push @files, $fixed_path;
    
    (my $spec_id = $_) =~ s#(.*)\.x?html#$1#is;
    $spec_id = lc($spec_id);
    
    if ($spec_wanted{$spec_id}) {
        print "Fixing errata for $File::Find::name.\n";
        fix_errata($_, $File::Find::dir, $spec_id);
    }
    
    if ($_ eq 'epub-spec.css') {
        strip_css_bg($_);
    }
}


sub fix_errata {

	# point errata links out to the web so people don't see stale info
	
	my ($spec, $path, $id) = @_;
	$path =~ s#^\.?/##;
	
	my $c = read_file($spec);
	
	$c =~ s#<a( class="link")? href="(./)?([^"]+)">errata</a>#<a$1 href="http://www.idpf.org/epub/$path/$3">errata</a>#is;
	
    # have to manually fix references to old specs 
    $c =~ s#href="(../)+(301?/[^"]+)"#href="http://www.idpf.org/epub/$2"#gis;
	
	write_file($spec, $c);

}


sub read_file {
	my $file = $_[0];
	local $/ = undef;
	open(my $fh_in, '<', $file) or die "Could not open $file to read: $!\n";
	my $c = <$fh_in>;
	close($fh_in);
	return $c;
}


sub write_file {
	my ($file, $c) = @_;
	open(my $fh_out, '>', $file) or die "Could not open $file to write: $!\n";
	print $fh_out $c;
	close($fh_out);
}


sub strip_css_bg {
    # strips the first body rule containing the scrolled bg image
    my $css = $_[0];
    my $c = read_file($css);
    $c =~ s/body\s*{[^}]+}//is;
    write_file($css, $c);
}


sub generate_opf {

    open(my $fh, '>:utf8', $package) or die "Failed to write the package file: $!\n";
    
    my $i = 1;
    
    my $modtime = strftime("%Y-%m-%dT%H:%M:%SZ", gmtime);
    
    print $fh <<PKG;
<?xml version="1.0" encoding="utf-8" ?>
<package xmlns="http://www.idpf.org/2007/opf" xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:dcterms="http://purl.org/dc/terms/" version="3.0" xml:lang="en"
	unique-identifier="uid">
	<metadata>
		<dc:identifier id="uid">org.idpf.epub${epub_version}</dc:identifier>
		<dc:title>EPUB 3.1</dc:title>
		<dc:language>en</dc:language>
		<meta property="dcterms:modified">$modtime</meta>
		<dc:creator>Markus Gylling</dc:creator>
		<dc:creator>Matt Garrish</dc:creator>
		<dc:publisher>International Digital Publishing Forum (IDPF)</dc:publisher>
		<dc:rights>Copyright © 2010-2016 IDPF</dc:rights>
	</metadata>
	<manifest>
		<item id="nav" href="nav.xhtml" media-type="application/xhtml+xml" properties="nav"/>
		<item id="fb" href="unsupported.xhtml" media-type="application/xhtml+xml"/>
PKG
    
    my %spine;
    my @nonlinear;
    
    foreach my $file (@files) {
        (my $ext = $file) =~ s/^.*\.//;
        $ext = lc($ext);
        
        if ($ext =~ /license/) {
            print $fh '		<item id="res' . sprintf('%03d',$i) . '" href="' . $file . '" media-type="text/plain" fallback="fb"' . "/>\n";
        }
        else {
            print $fh '		<item id="res' . sprintf('%03d',$i) . '" href="' . $file . '"' . ($core_media{$ext} ? ' media-type="' . $core_media{$ext} . '"' : ' media-type="' . $alt_media{$ext} . '" fallback="fb"') . "/>\n";
        }
        
        if ($ext =~ /x?html/i) {
            (my $shortname = $file) =~ s#.*/(.*)\.x?html#$1#is;
            
            if ($spec_wanted{$shortname}) {
                $spine{$shortname} = '		<itemref idref="res' . sprintf('%03d',$i) . '"/>' . "\n";
            }
            else {
                print "Content-like document $file marked as non-linear\n";
                push @nonlinear, '		<itemref idref="res' . sprintf('%03d',$i) . '" linear="no"/>' . "\n";
            }
        }
        elsif ($ext !~ /(jpe?g|png|css|js)/i) {
            push @nonlinear, '		<itemref idref="res' . sprintf('%03d',$i) . '" linear="no"/>';
        }
        else {
            print "File $file does not appear to be a content document. Omitted from spine.\n";
        }
        $i++;
    }
    
    print $fh <<PKG;
	</manifest>
	<spine>
PKG

    foreach my $id (@spec_order) {
        print $fh $spine{$id};
    }
    
    print $fh join("\n",@nonlinear), "\n";

    print $fh <<PKG;
	</spine>
</package>
PKG

    close($fh);

}


sub generate_nav {

    open(my $fh, '>:utf8', $nav) or die "Failed to write the nav doc: $!\n";
    
    print $fh <<HTML;
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops">
	<head>
		<title>EPUB 3.1</title>
		<meta charset="utf-8"/>
		<style>
		  ol { list-style-type: none; }
		</style>
	</head>
	<body>
		<nav epub:type="toc">
			<ol>
HTML
    
    my %toc;
    
    foreach my $file (@files) {
        
        (my $ext = $file) =~ s/^.*\.//;
        $ext = lc($ext);
        unless ($ext =~ /x?html/i) { next; }
        
        (my $shortname = $file) =~ s#.*/(.*)\.x?html#$1#is;
        
        my $c = '';
        
        {
            local $/ = undef;
            open(my $fin, '<:utf8', $file) or die "Failed reading $file: $!\n";
            $c = <$fin>;
            close($fin);
        } 
        
        my $title = '';
        
        if ($c =~ m#<title>(.*?)</title>#is) {
            $title = $1;
        }
        
        else {
            print "No title found for $file. Using file name.\n";
            $title = $file;
        }
        
        my $toc = '';
        
        if ($c =~ m#(<ul class="toc">.*?</ul>)\s*</?div>#gis) {
            $toc = $1;
            $toc =~ s#(</?)ul#$1ol#gis;
            $toc =~ s#</?span[^>]*>##gis;
            $toc =~ s#(href=['"])#$1$file#gis;
            $toc =~ s/[\r\n\s]+/ /gis;
            $toc{$shortname} = '				<li><span>' . $title . '</span>' . $toc . "</li>\n";
        }
        
        else {
            print "No toc found in $file. Adding single entry to the file.\n";
            $toc{$shortname} = '				<li><a href="' . $file . '">' . $title . "</a></li>\n";
        }
    }
    
    foreach my $id (@spec_order) {
        print $fh $toc{$id};
    }
    
    print $fh <<HTML;
			</ol>
		</nav>
	</body>
</html>
HTML

    close($fh);

}


sub pack_epub {
    print "Generating epub...\n";
    `java -jar ./util/epubcheck/epubcheck.jar -c ./util/epubcheck/suppress.txt -f $epub_dir -mode exp -save`;
    
    my $from = './temp/epub'.$epub_version.'.epub';
    my $to = './build/'.$epub_version.'/epub'.$epub_version.'.epub';
    copy($from, $to) or die "Could not copy $from to $to: $!\n";
}
