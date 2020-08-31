

## Requirements Review Status ##

Requirements have been reviewed by: Markus Gylling, Daniel Weck, addyournamehere

## Participants ##

| **Name** |  **Organization** | **Role** | **UT time** | **Preferred con call time** |
|:---------|:------------------|:---------|:------------|:----------------------------|
| George Kerscher |  DAISY | (coordinator) |   |  |
| Markus Gylling |  DAISY |  |   |  |
| Dianne Kennedy| IDEAlliance |   |   |


## Mission ##
This sub-group is tasked to update NCX for EPUB 2.1, resolving all known issues and shortcomings with the current EPUB NCX, and introducing new requested NCX features in collaboration with the ongoing DAISY revision (ANSI/NISO Z39.86-2011).

The subgroup is addressing problem 6 in "Current Industry Problems" in the charter: http://www.idpf.org/idpf_groups/IDPF-EPUB-WG-Charter-4-27-2010.html

Relevant lightning talks from the f2f:  [F2F201006Agenda#Navigation](F2F201006Agenda#Navigation.md)

## Requirements ##
### Increase the efficiency of the NCX grammar for the EPUB context ###

#### NAV\_R01 Maximize terseness (E) ####
_Rationale: The NCX size can become an obstacle in implementations that need to load the entire DOM._

**Requirement: In the redesigned NCX, ensure that terseness of the XML grammar is maximized.**


---


#### NAV\_R02 Lazy/Partial loading of navMap (E) ####
_Rationale: Even where the terseness is maximized in the NCX XML representation, the representation of an entire navMap can exceed available memory in a reading system._

**Requirement: The specification must define the behavior for partial/lazy loading of navMaps.**


---


#### NAV\_R03 Remove inapplicable NCX features (A) ####
_Rationale: The EPUB 2.01 NCX grammar contains constructs that, given the direct lift-over from DAISY of the NCX DTD, do not apply to the EPUB usage context. Some of these features were made optional in the 2.01 update; now is the time to get rid of them for real._ The [EPUB maintenance group tracker](http://www.daisy.org/epub) contains information about the concerned constructs.

**Requirement: In the redesigned NCX, ensure that no inapplicable features are included.**


---


### Enhance Metadata ###
#### NAV\_R04 Add a mechanism for machine-readable metadata in NCX (E) ####
_Rationale: The NCX grammar currently lacks machine-readable metadata to describe that nature of collections of, or individual, links._

**Requirement: Add constructs that allow the expression of machine-readable metadata in the NCX**


---


##### NAV\_R04\_1 Describe nature/semantic of the destination (E) #####
**Requirement: NAV\_R04 must be implemented so that it allows the expression of the nature/semantic of the link destination**

_Example: this navList contains a collection of links that refer to all page breaks in the publication_


---


##### NAV\_R04\_2 Allow distinguishing links along other axes than that of destination nature (A) #####
**Requirement: NAV\_R04 must be implemented so that it allows the distinguishing of navLists and navItems along other axes than that of the destination semantics.**

_Use case: An NCX ships with multiple navLists that describe the pagebreak semantic; each navList representing the location of pagebreaks in different editions of the same work._

This is a low priority requirement and significantly complicates the meta data's work on identifiers (identifying two documents at the same time)

---


### Enchance i18n support ###

#### NAV\_R05 Enhance global language support in labels (A) ####
_Rationale: The current NCX (human readable) labels for links and groups of links are limited in their i18n support (xml:lang and dir('rtl'|'ltr') are the only supported properties)_

**Requirement: Add support for inline markup in NCX labels that at minimum supports Ruby and the specification of spans of text (for bdo)**

**Dependency**: need input from EGLS subgroup regarding required inline markup, and requirements for vertical writing etc in NCX labels


---


### Support Bibliographic Citations ###

#### NAV\_06  Reading System must provide Bibliographic reference to user (A) ####

**Requirement:  Reading System must provide to the user a correct bibliographic reference that can be used to site the current location in the EPUB document.**

Use case: Students using EPUB can use their reading system to tell them the current location that can be used in writing formal papers.

**Dependency**: the META subgroup re defining work identifiers


---


#### NAV\_07 Reading System must Navigate to location based on Bibliographic Reference (A) ####
**Requirement: Reading System must provide the ability for a user to go to a location in a EPUB document based on a correct bibliographic reference.**

Use case: User is reading a formal paper and wants to check the reference in the publication.

**Dependency**: the META subgroup re defining work identifiers


---


### NAV\_10 Navigation in Video and timed-based media (B) ###
**Requirement: Video and other timed media should have identified navigation points in the content; the reading systems should enable the user to use these navigation points to move through the logical divisions of the time-based content.**

_Rationale: Content that is time-based, especial longer items, should have identified navigation points to quickly move through the information to the logical divisions._

_Use case: A student is viewing a video for a class. The video is one hour long and the student is looking for specific information. Navigation through the logical segments increases the utility of the video._

_Use case: A movie is provided with the screen play. The play is divided into acts and scenes. The navigation is provided to each act and scene, similar to a chapter and  section  navigation._

Remark: this requirement is related to ANNOT\_R4.5 (at least from a possible implementation perspective):
http://code.google.com/p/epub-revision/wiki/Annotations#ANNOT_R4.5_Identification_of_an_annotation_target_as_a_time_offs


---


### NAV\_11 Make OPF Optional ###
**Requirement: publications that do not supply an OPF file, but only have a single OPS file (named index.html?), will be considered legitimate. Specifically, Reading Systems will be required to treat them as if they had an OPF that pointed to that OPS file (i.e. the OPS file may be implicit in this simple case).**

_Rationale: Publications that do not have multiple chunks of OPS content, and contain no publication-level metadata, receive no benefit from an OPF file, so this is just overhead. This is burdensome to certain authoring workflows, in particular it makes it impossible to straightforwardly "zip up" XHTML that may have been authored or generated for other purposes into a conforming EPUB file, and contributes to a perception that EPUB is unnecessarily complex._


---


## Implementation Proposals ##
TBD