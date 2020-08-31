# When #

Conference call from 2100-2200 UTC on 23 Nov 2010

# Who #

Present:

  * Karen Broome
  * Markus Gylling
  * Daniel Weck
  * Dan Hughes
  * Bill Kasdorf
  * Keith Fahlgren
  * John Rivlin

Regrets:

  * Peter Sorotokin
  * Norm Walsh

# What #

## Why not DOI? ##

Bill K clarifies that DOI provides uniqueness and persistence, in addition to having defined solutions to changing ownership or changing resources (at the other end).

Markus G repeats Bill M's question: Why not DOI?

Keith F asks why DOIs haven't appeared in EPUBs already if it's a good solution? Bill K notes that some STM publishers are using DOIs for EPUBs.

Dan H discusses some of the properties of DOIs that are already standardized: resolvers, tools for disambiguation. He asks that we develop LinkingSolutionProCon.

Karen B raises the concern that these systems tend to fall apart because of specifying **when** objects get new versions.

Dan H explains that DOIs can be registered without being the rightsholder. Bill K wonders if this is accurate?

## The tension between loose links and very strict links ##

Keith F clarifies that other (perhaps HTTP-based) solutions deliberately invert the control from the rightsholder toward the individual user (or client). Bill K suggests that this is much closer to librarianship.

Karen B is concerned that OpenURL hasn't been widely used outside of English-language content.

## John R's solution from the SF F2F ##

Bill K believes

John R recaps:

  * A URI (that might be a URL)
  * An arbitrary number of path segments
  * An identifier (unique within the hostname)
  * A segment with a version number (1.2.3 or a.b.c or 1.4.en)
  * The version numbers would be able degrade (1.2 matches 1.2.3 and 1 matches 1.2.3)

Other ideas that have been discussed:

  * Query params for fuzzy matching

Keith F raises two issues:

  * How can an offline reading system understand an `<a href=` to a URI that looks like any other HTTP URI is actually a reference to an EPUB?
  * What is the (default?) hostname for existing documents?