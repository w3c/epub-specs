The IDPF EPUB workshop for fixed layout was held in Taipei on 2011-10-25 from 09:00 CST (01:00:00 UTC) to 16:00 CST (08:00 UTC).


## Attendees ##

Attendees included over 50 local and approximately 20 remote participants ([TaipeiAttendanceList](TaipeiAttendanceList.md)).  [Chat log](TaipeiMeetingChatLog.md) from the remote participants is available.



## Agenda ##

The draft meeting agenda was confirmed as per [TaipeiFixedLayoutWorkshop](TaipeiFixedLayoutWorkshop.md), with a slight change in order of presentations. A roll call was deferred due to time constraints and the large number of attendees. but attendees were asked to add their names to the list [TaipeiAttendanceList](TaipeiAttendanceList.md). A sign-up sheet was circulated for physical attendees.

## Presentations ##

Bill McCoy made opening remarks about the IDPF Intellectual Property (IP) policy governing the meeting, philosophy of standards development in IDPF, a definition of fixed layout and motivation for addressing fixed layout in EPUB, including reviewing a letter from key publishers in the Association of American Publishers (AAP) Digitial Interest Working Group (DIWG) urging prompt action by the IDPF. Bill's presentation slides: [4](4.md).

Makoto Murata reviewed a [taxonomy of fixed layout solutions](TaxonomyOfMechanismsForFixedLayout.md), [generic requirements for fixed layout](GenericRequirementsOnFixedLayout.md), and [PossibleOutcomesForFixedLayout possible outcomes](.md) in terms of approaches to specification additions/changes.

Presentations were made as per the agenda by Dave Cramer (Hachette Book Group) [4](4.md), Roger Webster (Barnes & Noble) [5](5.md), Takeshi Kanai (Sony) [6](6.md), Masao Murata (Fuji Film) [7](7.md), and  Yoshinori Ohmura (Impress) [8](8.md).

## Rough consensus ##

Discussion ensued about several points. Calls for rough consensus were made by Makoto on two points (with the caveat that by this time most remote participants had left the call due to it being quite late in their time zones):

  * a) support for the concept of attaching layout metadata according to the proposal by Kanai (Sony), with extension to support item-level metadata (to allow varying page sizes within a publication as per Apple proposal, without requiring parsing content files). No objections were raised; however, Webster (BN) expressed concern regarding overhead of processing every opf file in a case of  composite publication, and supported Kanai's proposal to introduce additional string in the rootfile (which would support presenting users a choice of which rendition to open).

There were some discussions about the relationship between meta elements of HTML (as in
[iBooksFixedLayout](iBooksFixedLayout.md)) and metadata in package documents (as in Kanai's proposal).  Some people think that meta elements in HTML are useful (especially for HTML renderers) but metadata for EPUB serve different purposes such as selection of a package document among more than one package document within a single OCF file.


  * b) support for the concept that, given the various use cases and workflows presented, it was not reasonable to impose limitations on type of fixed-layout content (CSS abs pos, SVG, bitmap). No objections were registered.

It was observed during discussion that the replica map concept proposed by BN seemed compatible with the proposal from Fuji Film relative to sub-page frame description for manga.

King-Wai (ASTRI) noted: replica map could be a generalization of media overlays.

Bill noted: replica map seems similar to AAL's concept of page template geometry. Any synergy there? Roger indicated he needed to review AAL proposal in more detail.

## Action items ##
Action items taken were:

  1. Takeshi Kanai to lead ad hoc group to specify rendition metadata. As a first step, he agreed to consider whether some or all of the proposed metadata could be applicable to individual items in the spine as well as at publication levels. Interested parties to sign up on [RenditionMetadataAdHocGroup](RenditionMetadataAdHocGroup.md).
  1. Roger Webster to lead ad hoc group to specify rendition map data structure. As a first step, he agreed to update the proposal based on discussion by Nov. 9. This ad-hoc group will also consider the introduction of additional string in the rootfile or rendition map. Interested parties to sign up on [RenditionMappingAdHocGroup](RenditionMappingAdHocGroup.md).
  1. Bill/Markus to work with IDPF Board to determine the process for approving additional vocabularies (per #1) and also to consider impact of adding rendition map data structure (per #2, i.e. would it require a new WG or could it be a maintenance release item or work product of existing WG?.

It was mentioned that items #1 and #2 would need to be coordinated and could be combined into a single new WG charter, and as well should be appropriately coordinated with Advanced Adaptive Layout WG. Bill pointed out that responding to the emergency call" from AAP DIWG to avoid immediate fragmentation might require expediting #1.