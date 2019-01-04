# OCF 3.2 Reading System Conformance

## Introduction

Open Container Format (OCF) 3.2 is the packaging mechanism for EPUB 3.2. The contents of an EPUB publication are packaged into an OCF ZIP Container. This document details how EPUB Reading Systems process OCF ZIP Containers. The creation of OCF ZIP Containers is covered in the [OCF spec](tk).

OCF is fundamentally a ZIP archive, but with some restrictions on how files are named, organized, and what ZIP features are used. These restrictions are in place to improve interoperability, and allow as many systems as possible to create and process EPUB publications.

EPUB reading systems, when processing an OCF ZIP Container, have several obligations. First, they must confirm that the document is an OCF ZIP Container. Second, they must determine if the OCF ZIP container can be processed. Finally, they must access the contents of the container, starting with `/META-INF/container.xml`. 

We do not specify what an EPUB Reading System must do when faced with the errors described below. In some cases, the errors would make it impossible for an EPUB Reading System to access the contents of the container. In other cases, it's possible the reading system could access the contents, but we do not state if it is obligated to do so.

## Basic conformance for OCF ZIP Processors

OCF ZIP Processors must broadly support the ZIP specification. 

OCF Processors MUST support the ZIP64 extensions defined as "Version 1".
 
Note: when editing or processing OPF ZIP Containers, an OCF ZIP Processor has no obligation to preserve information that is not deines within the OCF Abstract Container. In particular, an OCF ZIP Processor need not preserve:

 * CRC values
 * Comment fields
 * External file attributes
 * Extra field 

## Identifying an OCF ZIP Container

The first file in the OCF ZIP Container MUST be the mimetype file. The contents of this file MUST be the MIME media type [RFC2046] string `application/epub+zip` encoded in US-ASCII [US-ASCII].

Issue: what does the reading system do if this is not true?

## Can the OCF ZIP Container be processed?

1. If the OCF ZIP Container uses ZIP encryption features, it is in error. This can be identified by the presence of an Archive decryption header or an Archive extra data record.

2. If the OCF ZIP Container is split across multiple files or multiple storage media, it is in error. 

3. If the OCF ZIP Container uses compression techniques other then Deflate, it is in error. This can be identified by the presence of values other than 0 or 8 in the compression method field in the local file header tables. 

4. In the OCF ZIP Container, the "version needed to extract" fields of the local file header tables MUST be set to the values 10, 20 or 45 in order to match the maximum version level needed by the given file. If ZIP64 is needed, the value must be set to 45. If Deflate but not ZIP64 is required, the value must be set to 20. If neither Deflate nor ZIP64 is required, the value must be 10. Any other value is an error. 

## Access the contents of the zip container

### Access `/META-INF/container.xml`

An OCF Processor MUST consider the first rootfile element within the rootfiles element to represent the Default Rendition for the contained EPUB Publication. Reading Systems are REQUIRED to present the Default Rendition, but MAY present other Renditions in the container.

OCF Processors MUST ignore foreign elements and attributes within a container.xml file

### Other files in `META-INF`

This directory contains the files specified in META-INF Reserved Files. Files other than the ones listed in that section MAY be included in the META-INF directory; OCF Processors MUST NOT fail when encountering such files.

#### encryption.xml

#### manifest.xml

`manifest.xml` exists for compatibility with the Open Document Format (ODF). The `manifest` element contained within a Package Document specifies the one and only manifest used for processing a given Rendition. Ancillary manifest information contained in the ZIP archive or in the OPTIONAL `manifest.xml` file MUST NOT be used for processing the Rendition.


#### metadata.xml

#### rights.xml

#### signatures.xml

