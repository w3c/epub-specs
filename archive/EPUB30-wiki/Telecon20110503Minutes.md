## Timelines ##

intent to publish new WD this week. target friday

relative cfi is still an issue. address at tomorrow's call

minor issues may remain open in WD

new issue about URIs in bindings

awaiting input. may be solvable this week

## epub:switch ##

switch proposal is in draft now

epub2 reading systems should not break: required-modules is dropped,
require-namespace remains but is loosened to any uri that identifies the extension

registry to be created for maintaining identifier uris for new features

should we identify the location of the registry in the spec?

preprocessing of documents should be avoided. should be done in dom context

switch must be processed as though @hidden has been set on all but one child

inherit hidden semantics from html5

declarative approach avoids scripting

object cannot be used because it supports out-of-line content

would not work for elements, because they will not have unique mime types

object also could break flowable content in cases like musicml

makoto: has html5 wg been contacted? may see this as a fork

we are free to define new constructs where they are needed

the extensibility mechanism of html5 has been consulted

only one namespace for extensions: trigger and type are moved into 2007 namespace

RESOLVED: re-introduce switch

ACTION: review Murata's global question re politics of namespace extensions

## CSS Prefixes ##

problem of pushing updates to author tools if using prefixed/unprefixed

consider compromise between two options: acknowledge prefix versions and be silent on future developments

epubcheck would not issue warning on unprefixed versions. can also ignore unprefixed if prefixed version is present

could add a note that both should be included when module reaches CR
no requirement to add unprefixed

summary: the spec will use prefixed version, dated URIs for syntax, undated for semantics and a note for future authoring practices

RESOLVED: move ahead with this approach

ACTION: ted, markus to begin updating

ACTION: ted: list with URIs to dated CSS3 modules that we use in our profile, list of css2.0 properties not carried over to css2.1

## CSS Properties ##

should text-trim be dropped?

not dropped from draft but has been merged with another

is this loss a major drawback?

not fatal. will be removed from profile

can be done by kerning, but not as well

RESOLVED: drop.

epub-ruby-position needs a name value

inter-character has been suggested in wg, inter-base proposed

semantic is correct

names in css are likely to change

ultimately a syntactic alias

RESOLVED: use inter-base