

**Note: decision on [0721 telcon](MeetingMinutes100721.md) to go with "Solution B" with an optional/desired "late binding" to then-current HTML5 specifications. That is, if target specifications were "solid" at the time of our publication we would reference those elements in their native HTML5 namespace, rather than pulling them into ours as is suggested by "Solution B."**



## Solution A: reference dated HTML5 draft ##
Produce a new OPS based on referencing a dated version of the HTML5 draft. The semantics of the HTML5 vocabulary would be "frozen" via the dated reference. OPS would define local schema/grammar(s) that describes the OPS adaption(s) of HTML5, but would defer all definitions of semantics and behaviors to the HTML5 draft.

### Pros ###

No heavy-lifting required: we'd simply adopt a version of the HTML5 draft.

### Cons ###

We don't own the HTML5 namespace and such a snapshot would be incompatible with the on-going work of the HTML5 WG.

Goes against the charter's intention of keeping up with HTML5 as it moves along, unless we integrate the idea of publishing minor updates (3.01, 3.02 etc) when/if element semantics change. These minor updates would essentially contain a new snapshot.

## Solution B: compound namespaces ##
Produce a new OPS using the following principles (compare solution A):
  1. elements that have no semantics beyond what CSS can capture are included in OPS in the XHTML namespace ("simple" elements)
  1. elements that do have semantics beyond what CSS can capture (audio, video, canvas, forms, etc) and that are deemed to be likely to change before HTML5 becomes a REC are brought in in an OPS namespace, thereby creating a local semantic definition. This is an alternative to the "freeze" approach in solution A above.
  1. This solution may include referencing HTML4 instead of 5 for the definition of the elements in 1 above. _TBD how would the new "simple" elements in HTML5 (section, hgroup, figure, etc) be defined using this scheme?_

### Pros ###

We own the namespace and can define our own semantics.

### Cons ###

Probably quite a lot of work: we'll have to review every element in the HTML5 spec.

Still goes against the intention to keep up with HTML5 as it goes along.

## Solution C: wait for REC ##
Produce an EPUB 2.1/3.0 draft, and let it stay in draft form until the W3C specs it depends on have become RECs. Update our draft whenever W3C publishes a new draft.

### Pros ###

Overall risk-free, this would avoid adopting elements that won't be in the final spec or deprecated semantics.

Our draft could keep up with HTML5.

### Cons ###

We'll probably have to wait for several years before HTML5 can reach such a status (according to WHAT WG 2020, late 2013 for the W3C).