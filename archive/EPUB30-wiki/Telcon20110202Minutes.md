## Present ##

## Regrets ##


## Specifications ##

the way the requirements are laid out is inconsistent

sometimes in dedications sections and sometimes embedded, difficult to follow and maintain

will be attempting to remedy. completely separate doc for reading documents possibility but may be too late at this stage

benefit to keeping in one place in terms of content creation and expected behaviour

notes are intended to be contextual information. never normative statements

notes are pointers to other areas to understand the current

input on this approach is welcome

all input is welcome, not just what is in the explicit trails

## Working Draft Approval ##

working group needs to make a vote to submit specs to the board prior to their becoming a public draft

public review can start after board approves. expected feb. 14

can start a 90 day review and at 60 day start a 30 day membership review

interim and final IP calls for review that take 45 days each

members are required to disclose IP

if any claims are made there is an  opportunity to spec around and avoid claim

working group vote needs to be taken next week. we are blessing publication of public draft, but still open to change during public period

will try to vote by middle of next week

## SVG ##

SVG entries will be dealt with on Friday, send Markus an email to be included

## Scripting ##

there is consensus to support javascript only for scripting

javascript may be the only practical choice

possibly may be difficult to restrict version of javascript. implementers can restrict

decision to be silent on javascript versions in the spec

ACTION: markus to remove remark from CD about javascript version

## Metadata ##

ACTION: bill will set up call with metadata group to discuss issues

## Linking ##

xpointer element scheme, etc. look like they could address what we need for fragment identification, but they don't solve sorting without access to document and character level pointing

we should use existing standards where possible, but is it possible here?

important to be able to sort for collaborative work; to look at the same location

if there are a lot of people viewing, you need server-side technology, for example, to find all annotations. they may only wish to select a subset of these annotations. need to know which annotations fall under that interval

fragment identifiers loses capabilities. but canonical ids much less likely to break

proposal is still open. difficult to move forward because different ideas on other options

there are proprietary ways to solve, but doesn't allow interoperability

part of peter's proposal is to have a unique scheme name to not exclude other schemes from being developed. not locked in forever

possibly need to submit scheme to ietf

if not submitted, whatever we define will only work with epub3 reading systems. all others are out of our control

perhaps not use fragment identifiers to avoid, but question of what other approach

if we don't use uris we lose the freedom they provide

could be a long process to register

vendor media type could take less time

fragment identifiers are not linked to a media type. designed so anyone can add new types as needed

semantics depends on media type

is it possible to include this scheme in spec with a note that it is provisional pending resolution with ietf/iana? do both in parallel

common approach in w3c. less likely to be criticized

question of whether we should work with them to add. not what we need right now

w3c are not interested at this time. not part of their charter

media fragment for archive file may need more consideration

attempt to get this in by the 14th and note that it is a feature that may be removed if found lacking later

try reaching out to w3c. send information on our proposal

understand that we are addressing an immediate need with this proposal

[Hadrien](Hadrien.md) http://www.w3.org/TR/media-frags/#standardisation-URI-fragments

we should also send a draft to ietf and start a discussion

[Hadrien](Hadrien.md) important read about the situation with mimetypes and fragments

[Hadrien](Hadrien.md) "As such, the intention of this document is to propose a specification to all media type owners in the audio/`*`, image/`*`, and video/`*`; branches for a structured approach to URI fragments and for specification of commonly agreed dimensions to address media fragments (i.e. subparts of a media resource) through URI fragments."

[Hadrien](Hadrien.md) "We recommend media type owners to harmonize their existing schemes with the ones proposed in this document and update or add the fragment semantics specification to their media type registration."

ACTION: markus to remove remark from CD about javascript version

ACTION: bill will set up call with metadata group to discuss issues

[mgylling](mgylling.md) ACTION: x to inform W3C about the epubcfg draft

[mgylling](mgylling.md) ACTION: Murata-san to start work on IETF registration of epub media type