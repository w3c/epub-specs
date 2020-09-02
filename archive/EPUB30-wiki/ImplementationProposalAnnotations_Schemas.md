Refers to [ImplementationProposalAnnotations](ImplementationProposalAnnotations.md). This grammar may be out-of-date as the content model is still being discussed.

# W3C XSD schema #

```
<?xml version="1.0" encoding="Windows-1252"?>
<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified"
           xmlns:ann="http://www.idpf.org/2011/annotation"
           targetNamespace="http://www.idpf.org/2011/annotation"
           xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xs:element name="annotations">
    <xs:complexType>
      <xs:sequence>
        <xs:element maxOccurs="unbounded" name="annotation">
          <xs:complexType>
            <xs:sequence>
              <xs:element name="contentReference" type="ann:contentReferenceType" />
              <xs:element name="annotationContent" type="ann:annotationContentType" />
            </xs:sequence>
            <xs:attribute name="id" type="xs:string" use="required">
              <xs:annotation>
                <xs:documentation>
                  a valid uuid
                </xs:documentation>
              </xs:annotation>
            </xs:attribute>
          </xs:complexType>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>

  <xs:complexType name="contentReferenceType">
    <xs:annotation>
      <xs:documentation>
        This points to the content that has been annotated
      </xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:element name="referencedDocument" type="xs:string" />
      <xs:element name="referencedContent" type="ann:referencedContentType"/>
      <xs:element name="date" type="xs:dateTime" minOccurs="0"/>
      <xs:element name="contentSignature" type="SHA1" minOccurs="0"/>
      <xs:element name="renderinginfo" type="ann:renderingInfoType" minOccurs="0"/>
    </xs:sequence>
  </xs:complexType>

  <xs:complexType name="referencedContentType">
    <xs:sequence maxOccurs="unbounded">
      <xs:choice>
        <xs:element name="range" type="ann:rangeType"/>
        <xs:element name="point" type="ann:partLocationType"/>
      </xs:choice>
    </xs:sequence>
  </xs:complexType>

  <xs:complexType name="annotationContentType">
    <xs:sequence>
      <xs:element name="author" type="ann:authorType"/>
      <xs:element name="range" type="ann:rangeType"/>
      <xs:element name="date" type="xs:dateTime" minOccurs="0"/>
    </xs:sequence>
  </xs:complexType>


  <xs:complexType name="authorType">
    <xs:sequence>
      <xs:element name="name" type="xs:string" />
      <xs:element name="dsig" />
    </xs:sequence>
  </xs:complexType>

  <xs:complexType name="renderingInfoType">
    <xs:annotation>
      <xs:documentation>
        hints for the UA on how to render the annotation,
        this still needs lots of discussion
      </xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:element name="balloon" />
    </xs:sequence>
  </xs:complexType>

  <xs:complexType name="rangeType">
    <xs:sequence>
      <xs:element name="start" type="ann:partLocationType"/>
      <xs:element name="end" type="ann:partLocationType"/>
    </xs:sequence>
  </xs:complexType>

  <xs:complexType name="partLocationType">
    <xs:sequence>
      <xs:element name="part" type="xs:string" />
      <xs:element name="location" type="ann:locationType" />
    </xs:sequence>
  </xs:complexType>

  <xs:complexType name="locationType">
    <xs:annotation>
      <xs:documentation>
        xpath (a subset?)
      </xs:documentation>
    </xs:annotation>
    <xs:sequence>
      <xs:element name="uniqueString" type="xs:string" />
      <xselement name="nearbyID" type="xs:ID" />
      <xs:element name="xpath+offset" type="xs:string"/>
    </xs:sequence>
  </xs:complexType>

</xs:schema>
```

# Relax NG #

Warning: this is an automated conversion of xsd above...

```
<rng:grammar
   xmlns:rng="http://relaxng.org/ns/structure/1.0"
   xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
   xmlns:ann="http://www.idpf.org/2011/annotation"
   ns="http://www.idpf.org/2011/annotation"
   datatypeLibrary="http://www.w3.org/2001/XMLSchema-datatypes">

   <rng:start combine="choice">
      <rng:ref name="annotations"/>
   </rng:start>
   
   <rng:define name="annotations">
      <rng:element name="annotations">
         <rng:oneOrMore>
            <rng:element name="annotation">
               <rng:element name="contentReference">
                  <rng:ref name="contentReferenceType"/>
               </rng:element>
               <rng:element name="annotationContent">
                  <rng:ref name="annotationContentType"/>
               </rng:element>
               <rng:attribute name="id">
                  <rng:data type="string">
                     <a:documentation>
                        a valid uuid
                     </a:documentation>
                  </rng:data>
               </rng:attribute>
            </rng:element>
         </rng:oneOrMore>
      </rng:element>
   </rng:define>

   <rng:define name="contentReferenceType">
      <a:documentation>
         This points to the content that has been annotated
      </a:documentation>
    
      <rng:element name="referencedDocument">
         <rng:data type="string"/>
      </rng:element>
      <rng:element name="referencedContent">
         <rng:ref name="referencedContentType"/>
      </rng:element>
      <rng:optional>
         <rng:element name="date">
            <rng:data type="dateTime"/>
         </rng:element>
      </rng:optional>
      <rng:optional>
         <rng:element name="contentSignature">
            <rng:data type="string"/>
         </rng:element>
      </rng:optional>
      <rng:optional>
         <rng:element name="renderinginfo">
            <rng:ref name="renderingInfoType"/>
         </rng:element>
      </rng:optional>
   </rng:define>
   
   <rng:define name="referencedContentType">
      <rng:choice>
         <rng:element name="range">
            <rng:ref name="rangeType"/>
         </rng:element>
         <rng:element name="point">
            <rng:ref name="partLocationType"/>
         </rng:element>
      </rng:choice>
   </rng:define>

   
   <rng:define name="annotationContentType">
      <rng:element name="author">
         <rng:ref name="authorType"/>
      </rng:element>
      <rng:element name="range">
         <rng:ref name="rangeType"/>
      </rng:element>
      <rng:optional>
         <rng:element name="date">
            <rng:data type="dateTime"/>
         </rng:element>
      </rng:optional>
  </rng:define>

  <rng:define name="authorType">
     <rng:element name="name">
        <rng:data type="string"/>
     </rng:element>
     <rng:element name="dsig"/>
  </rng:define>

  <rng:define name="renderingInfoType">
     <a:documentation>
        hints for the UA on how to render the annotation,
        this still needs lots of discussion
    </a:documentation>
    
    <rng:element name="balloon"/>
  </rng:define>

  <rng:define name="rangeType">
     <rng:element name="start">
        <rng:ref name="partLocationType"/>
     </rng:element>
     <rng:element name="end">
        <rng:ref name="partLocationType"/>
     </rng:element>
  </rng:define>

  <rng:define name="partLocationType">
     <rng:element name="part">
        <rng:data type="string"/>
     </rng:element>
     <rng:element name="location">
        <rng:ref name="locationType"/>
     </rng:element>
  </rng:define>

  <rng:define name="locationType">
    <a:documentation>
        xpath (a subset?)
    </a:documentation>
    <rng:element name="xpath">
       <rng:data type="string"/>
    </rng:element>
  </rng:define>

</rng:grammar>
```