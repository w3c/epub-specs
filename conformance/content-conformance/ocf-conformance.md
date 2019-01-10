# OCF

Open Container Format (OCF) 3.2 is the packaging mechanism for EPUB 3.2. The contents of an EPUB publication are packaged into an OCF ZIP Container. This document details how authors create OCF ZIP Containers. How EPUB Reading Systems process OCF ZIP containers is in a [separate document]. 

OCF is fundamentally a ZIP archive, but with some restrictions on how files are named, organized, and what ZIP features are used. These restrictions are in place to improve interoperability, and allow as many systems as possible to create and process EPUB publications.

## The OCF Abstract Container

Issue: can we avoid this confusing terminology?

### Introduction 

The goal of EPUB packaging is to have all the content of a publication in one place, available to reading systems to present to the reader. To facilitate that, we introduce the concept of the OCF Abstract Container. That's a fancy way of describing a directory or folder structure. A single common root directory holds all the local resources of the publication. It has a child directory, called `META-INF`, which is used to store certain special files, most notably the required `container.xml`. 




### File and Directory Structure

The virtual file system for the OCF Abstract Container MUST have a single common Root Directory for all of the contents of the container.

The OCF Abstract Container MUST include a directory named META-INF that is a direct child of the container's Root Directory. Requirements for the contents of this directory are described in META-INF Directory.

The file name mimetype in the Root Directory is reserved for use by OCF ZIP Containers, as explained in OCF ZIP Container.

All other files within the OCF Abstract Container MAY be in any location descendant from the Root Directory, provided they are not within the META-INF directory.


### Referencing EPUB Components

Files within the OCF Abstract Container MUST reference each other via relative IRI references ([RFC3987] and [RFC3986]). 

Confusingly, relative references from files in META-INF use the Root Directory of the OCF Abstract Container as the default Base IRI.

### File Name Restrictions

The File Name restrictions described in this section are designed to allow Path Names and File Names to be used without modification on most commonly used operating systems.

 * File Names MUST be UTF-8 [Unicode] encoded.

 * File Names MUST NOT exceed 255 bytes.

 * The Path Name for any directory or file within the OCF Abstract Container MUST NOT exceed 65535 bytes.

 * File Names MUST NOT use the following [Unicode] characters, as these characters might not be supported consistently across commonly-used operating systems:

   * SOLIDUS: / (U+002F)

   * QUOTATION MARK: " (U+0022)

   * ASTERISK: * (U+002A)

   * FULL STOP as the last character: . (U+002E)

   * COLON: : (U+003A)

   * LESS-THAN SIGN: < (U+003C)

   * GREATER-THAN SIGN: > (U+003E)

   * QUESTION MARK: ? (U+003F)

   * REVERSE SOLIDUS: \ (U+005C)
   
   * VERTICAL BAR: | (U+007C)

   * DEL (U+007F)

   * C0 range (U+0000 … U+001F)

   * C1 range (U+0080 … U+009F)

   * Private Use Area (U+E000 … U+F8FF)

   * Non characters in Arabic Presentation Forms-A (U+FDDO … U+FDEF)

   * Specials (U+FFF0 … U+FFFF)

   * Tags and Variation Selectors Supplement (U+E0000 … U+E0FFF)

   * Supplementary Private Use Area-A (U+F0000 … U+FFFFF)

   * Supplementary Private Use Area-B (U+100000 … U+10FFFF)

 * All File Names within the same directory MUST be unique following case normalization as described in section 3.13 of [Unicode].

 * All File Names within the same directory SHOULD be unique following NFC or NFD normalization [TR15].
 
 Note: If you have no idea what NFC normalization is, see http://www.macchiato.com/unicode/nfc-faq
 
Q: should we use web references for this? https://www.w3.org/TR/charmod-norm/#unicodeNormalization

https://www.win.tue.nl/~aeb/linux/uc/nfc_vs_nfd.html

https://www.w3.org/International/questions/qa-html-css-normalization


### META-INF

The required `META-INF` directory is used to store certain special files, known as META-INF reserved files. Other files may be stored in META-INF. 

## OCF ZIP Container

### Introduction

### ZIP requirements

 * CF ZIP Containers must not be split or spanned across multiple files.
 
 * OCF ZIP Containers MUST include only stored (uncompressed) and Deflate-compressed ZIP entries within the ZIP archive. 
 
 * OCF ZIP Containers MAY use the ZIP64 extensions defined as "Version 1" in section V, subsection G of the application note [ZIP] and SHOULD use only those extensions when the content requires them.
 
 Issue: should "use" and "only" be switched? And why is this a MAY


### OCF ZIP Container Media Type Identification

The first file in the OCF ZIP Container MUST be the mimetype file, which satisfies the following requirements:


1. The contents of this file MUST be the MIME media type [RFC2046] string `application/epub+zip` encoded in US-ASCII [US-ASCII].

2. This file MUST NOT contain leading padding or white space.

3. This file MUST NOT being with a Unicode signature (or Byte Order Mark)

4. The mimetype file MUST NOT be compressed.

NOTE: No need to say not encrypted, it's already covered

5. There MUST NOT be extra fields in the file's header, as they break the "magic number."