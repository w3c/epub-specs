

# Solution Options #
## 1) Change nothing vis-a-vis 2.0.1 ##
  * RS support for embedded fonts is optional
  * RS support for mangling is optional
  * if embedded fonts are used, at least one should be opentype
  * embedded fonts may or may not be mangled

## 2) Strengthen RS reqs vis-a-vis 2.0.1 ##
  * RS support for embedded fonts is required _(if the RS has visual display capabilities)_
  * RS support for mangling is reqruied _(if the RS has visual display capabilities)_
  * if embedded fonts are used, at least one should/must be opentype
  * embedded fonts may or may not be mangled

## 3) Strengthen RS reqs and extend to support WOFF, inc mangling ##
  * RS support for embedded fonts is required _(if the RS has visual display capabilities)_
  * RS support for mangling is required _(if the RS has visual display capabilities)_
  * if embedded fonts are used, at least one should/must be opentype or WOFF
  * embedded fonts may or may not be mangled

## 4) Strengthen RS reqs and extend to support WOFF, excl mangling ##
  * RS support for embedded fonts is required _(if the RS has visual display capabilities)_
  * RS support for mangling is required _(if the RS has visual display capabilities)_
  * if embedded fonts are used, at least one should/must be opentype or WOFF
  * embedded fonts may or may not be mangled, except WOFF which must never be mangled


# Agenda/Minutes December 10, 2010 call #

## Still open questions/issues ##
### SVG fonts? ###
[Fujisawa-san EGLS Taiwan presentation](http://www.slideshare.net/fujisawa/user-defined-characters-solution-proposal)
## Solution options - list saturated? ##
## Solution options - ready to make a recommendation to WG? ##
## Mangling spec - changes needed for 3.0? ##
  * internal changes?
  * merge with OCF?