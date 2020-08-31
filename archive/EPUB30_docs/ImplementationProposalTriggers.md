# Proposal 1 #

Define ops:trigger element that can take these attributes
  * action (show|hide|play|pause|resume|mute|unmute)
  * ref - relative URL to the element which is an object of an action (#id form)
  * ev:event, ev:observer - defined in XML Events Recommendation (http://www.w3.org/TR/xml-events/ )

Action definition:
  * show - element's visibility property is set to visible
  * hide - element's visibility property is set to hidden
  * play - play from the beginning (only applicable to video or audio elements)
  * pause - pause playing (only applicable to video or audio elements)
  * resume - resume playing (only applicable to video or audio elements)
  * mute - mute sound (only applicable to video or audio elements)
  * unmute - unmute sound (only applicable to video or audio elements)