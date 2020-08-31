[Back to Indexes Main Page](IndexesMainPage.md)

# Indexes atomic components (draft) #

This page is a working list of the atomic components needed to make the various index types and use cases possible.



## index ##

reading system must be able to discover that an index exists and that it is an index (e.g. "isindex" flag)

## term ##

alphanumeric string; should allow for formatting such as bold, italic, etc.

## locator ##

need to include a method of specifying the nature of the target, i.e. whether it goes to a figure or table, so that the locator can be formatted differently if desired

## target ##

need to accommodate both single-point and ranges

## entry ##

wrapper for term + associated locator(s) and/or reference(s); _Point for discussion: we need to allow a single entry to contain multiple locators so we don't force legacy paper books to convert long strings of locators into separate term/locator pairs, yes?_ How is linking from each locator possible then?

## parent entry/subentry relationship ##

need some way to structurally represent the relationship between a parent entry and its subentries

## entry array ##

wraps a main entry and all of its associated subheadings, locators, cross references and other information

## decoration ##

  * as a separate character or string that serves as a modifier on the locator
  * as special formatting that serves as a modifier on the locator;

_Point for discussion: semantically, both kinds of "decoration" are the same; can we accommodate them structurally with a single atomic element, or do we need two different structures?_

## see reference ##

references to other indexes, e.g. “See Smith, John in title index”, are subsumed under this as being functionally the same

## see also reference ##

references to other indexes, e.g. “See also Smith, John in title index” are subsumed under this as being functionally the same

## generic cross-reference ##

(or whatever we decide to call it) needs to allow either plain text or a collection of links

## group break navigation data ##

A string of hyperlinked letters and/or digits (e.g., A-Z, 0-9) used to easily navigate to another section of the index. Could also be more granular, eg, AA-AG, AH-AL.