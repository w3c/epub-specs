use strict;
use warnings;

use Cwd;
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
    'epub-packages',
    'epub-contentdocs',
    'epub-mediaoverlays',
    'epub-ocf',
    'accessibility',
    'altss-tags',
    'epub-changes'
);

my %spec_wanted = map { $_ => 1 } @spec_order;

my @files;

my $base_dir = getcwd;
my $temp_dir = $base_dir . '/temp';
my $build_dir = $base_dir . '/build';
my $skeleton_dir = $base_dir . '/src/epub-skeleton';
my $epub_dir = $temp_dir . '/epub' . $epub_version;
my $epub_dir_html = $temp_dir . '/epub' . $epub_version . '-html';


prep();

generate_epub('3.0');
generate_epub('3.1');





sub prep {
    
    my $content_dir = $epub_dir . '/EPUB/';
    
    if (-e $epub_dir) {
        rmtree($epub_dir);
    }
    
    # copy the build dir for xhtml
    dircopy($skeleton_dir,$epub_dir) or die("$!\n");
    dircopy($build_dir,$content_dir) or die("$!\n");
    rmtree($content_dir . $epub_version . '/docs');
    rmtree($content_dir . $epub_version . '/schema');
    rmtree($content_dir . 'linking');
    rmtree($content_dir . 'dict');
    rmtree($content_dir . 'idx');
    rmtree($content_dir . 'previews');
    rmtree($content_dir . 'renditions');
    
    # create the html dir for 3.1 and bff
    dircopy($epub_dir, $epub_dir_html) or die("$!\n");
    #find(\&tidy, $epub_dir_html);
}



sub generate_epub {

    my $v = shift;
    
    undef @files;
    
    my $chk_dir = $v eq '3.0' ? $epub_dir : $epub_dir_html;
    
    find(\&specs, "$chk_dir/EPUB/");
    
    chdir($chk_dir);
    
    generate_opf($v, "$chk_dir/EPUB/");
    generate_nav($v, "$chk_dir/EPUB/");
    
    # this test is mostly pointless until future non-packed bff added
    if ($v =~ /^3\.[0-1]$/) {
        pack_epub($v,$chk_dir);
    }
}



sub specs {
    
    if ($_ eq '.htaccess') {
        unlink $_ or die "Failed to remove .htaccess file $File::Find::name: $!\n";
        return; 
    }
    
    # return if no dots in path - for some reason -d and -f aren't detecting directories - but allow LICENSE file
    return if $_ !~ /\./ and $_ ne 'LICENSE';
    
    # don't pick up root directory
    return if $_ =~ /\.+$/;
    
    # remove the various gz/zips that get generated
    (my $ext = $_) =~ s/^.*\.//;
    $ext = lc($ext);
    if ($strip{$ext}) { print "Removing unwanted media type $File::Find::name.\n"; unlink $_; return; }
    
    # strip the base dir to make relative
    (my $fixed_path = $File::Find::name) =~ s#$temp_dir/epub${epub_version}(-html)?/EPUB/##i;
    
    push @files, $fixed_path;

    (my $spec_id = $_) =~ s#(.*)\.x?html#$1#is;
    $spec_id = lc($spec_id);
    
    if ($spec_wanted{$spec_id}) {
        print "Fixing errata for $File::Find::name.\n";
        (my $path = $File::Find::dir) =~ s#$temp_dir/epub${epub_version}(-html)?/EPUB/##i;
        fix_errata($_, $path, $spec_id);
    }
}



sub tidy {
    (my $local_path = $File::Find::name) =~ s/^\.//;
    my $path = "$base_dir/$local_path";
    if (-d $path and $path !~ /mimetype/i) {
        my $tidy = `tidy.bat >nul 2>&1`;
    }
    else {
        if ($_ =~ /\.x?html$/i) {
            (my $html = $_) =~ s/\.xhtml/.html/i;
            move($_, $html) if $_ =~ /\.xhtml$/i;
            clean_xml($html);
        }
    }
}



sub clean_xml {

	my $html = shift;
	
	my $c = read_file($html);
	
	# get rid of the xml-y things tidy leaves behind 
	$c =~ s#<\?xml.*?\?>##s;
    $c =~ s#xmlns:(.*?)="[^"]+"##gis;
    $c =~ s#epub:type#role#gis;
	
	write_file($html, $c);

}




sub fix_errata {

	# point errata links out to the web so people don't see stale info
	
	my ($spec, $path, $id) = @_;
	$path =~ s#^\.?/##;
	
	my $c = read_file($spec);
	
	$c =~ s#<a\s+href="(\./)?([^"]+)">Errata</a>#<a href="http://www.idpf.org/epub/$path/$2">Errata</a>#is;
	
    # have to manually fix references to old specs 
    $c =~ s#href="(\.\./)+(301?/[^"]+)"#href="http://www.idpf.org/epub/$2"#gis;
	
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


sub generate_opf {

    my ($v, $dir) = @_;
    
    my $package = $dir . 'package.opf';
    
    open(my $fh, '>:utf8', $package) or die "Failed to write the package file: $!\n";
    
    my $i = 1;
    
    my $modtime = strftime("%Y-%m-%dT%H:%M:%SZ", gmtime);
    my $html_ext = ($v eq '3.0' or $v eq '3.1') ? 'xhtml' : 'html';
    my $html_media = ($v eq '3.0' or $v eq '3.1') ? 'application/xhtml+xml' : 'text/html';
    
    print $fh <<PKG;
<?xml version="1.0" encoding="utf-8"?>
<package xmlns="http://www.idpf.org/2007/opf" prefix="dc: http://purl.org/dc/elements/1.1/"
         version="${v}" xml:lang="en" unique-identifier="uid">
	<metadata xmlns:dc="http://purl.org/dc/elements/1.1/">
		<dc:identifier id="uid">org.idpf.epub${epub_version}</dc:identifier>
		<dc:title>EPUB 3.1</dc:title>
		<dc:language>en</dc:language>
		<meta property="dcterms:modified">$modtime</meta>
		<dc:creator>Markus Gylling</dc:creator>
		<dc:creator>Tzviya Siegman</dc:creator>
		<dc:creator>Matt Garrish</dc:creator>
		<dc:publisher>International Digital Publishing Forum (IDPF)</dc:publisher>
		<meta property="dc:rights">Copyright © 2010-2016 IDPF</meta>
	</metadata>
	<manifest>
		<item id="nav" href="nav.${html_ext}" media-type="${html_media}" properties="nav"/>
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
            print $fh '		<item id="res' . sprintf('%03d',$i) . '" href="' . $file . '"' . ($core_media{$ext} ? ' media-type="' . (($ext eq 'html' and ($v ne '3.0' and $v ne '3.1')) ? 'text/html' : $core_media{$ext}) . '"' : ' media-type="' . $alt_media{$ext} . '" fallback="fb"') . "/>\n";
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

    my ($v, $dir) = @_;
    
    my $nav = $dir . 'nav' . (($v eq '3.0' or $v eq '3.1') ? '.xhtml' : '.html');
    
    open(my $fh, '>:utf8', $nav) or die "Failed to write the nav doc: $!\n";
    
    if ($v eq '3.0' or $v eq '3.1') {
        print $fh <<XHTML;
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops">
	<head>
		<title>EPUB 3.1</title>
		<meta charset="utf-8"/>
XHTML
    }
    
    else {
        print $fh <<HTML;
<!DOCTYPE html>
<html>
	<head>
		<title>EPUB 3.1</title>
		<meta charset="utf-8">
HTML
    }
    
    
    my $toc = ($v eq '3.0' or $v eq '3.1') ? 'epub:type="toc"' : 'role="doc-toc"';
    
    print $fh <<HTML;
		<style>
		  ol { list-style-type: none; }
		</style>
	</head>
	<body>
		<nav $toc>
			<ol>
HTML
    
    my %toc;
    
    foreach my $file (@files) {
        
        (my $ext = $file) =~ s/^.*\.//;
        $ext = lc($ext);
        unless ($ext =~ /x?html/i) { next; }
        
        (my $shortname = $file) =~ s#.*/(.*)\.x?html#$1#is;
        my $fullpath = $dir . $file;
        
        my $c = '';
        
        {
            local $/ = undef;
            open(my $fin, '<:utf8', $fullpath) or die "Failed reading $fullpath: $!\n";
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
        
        if ($c =~ m#(<ol class="toc">.*?</ol>)\s*</?(nav|div)>#gis) {
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

    my ($v, $dir) = @_;
    (my $vn = $v) =~ s/\.//;
    
    print "Generating $v epub...\n";
    
    chdir($base_dir);
    
    # remove this flag once epubcheck gets 3.1 support and use -e
    my $flag = $v eq '3.0' ? '-e' : '-f';
    
    my $epubcheck = `java -jar ./util/epubcheck/epubcheck.jar -c ./util/epubcheck/suppress.txt $flag $dir -mode exp -save`;
    print $epubcheck;
    
    my $to = $base_dir.'/build/'.$epub_version.'/docs/epub'.$epub_version.'-v' . $vn;
    
    copy("${dir}.epub", "${to}.epub") or die "Could not copy ${dir}.epub to ${to}.epub: $!\n";
    
    dircopy($dir,$to) or die("$!\n");

}
