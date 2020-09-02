This page is a work-in-progress to collect and document changes to existing elements, and addition of new elements or attributes. This should encourage reuse of proposed changes, and help keep metadata grammar/vocabulary consistent and compact.

# Elements #

## Dublin Core ##

### dc:title ###

| **Element** | **Attribute** | **Solution Proposal # for Req #** | Notes |
|:------------|:--------------|:----------------------------------|:------|
| Title | authority | SP1 META\_R15 | new attribute |
| Title | display-seq | SP1 META\_R03 | new attribute |
| Title | file-as | SP1 META\_R03, SP1 META\_R04 | _file-as_ not currently allowed in dc:title per OPF |
| Title | sort-order | SP1 META\_R03, SP1 META\_R04 | new attribute |
| Title | type | SP1 META\_R03, SP1 META\_R04 | new attribute |

### dc:contributor ###

| **Element** | **Attribute** | **Solution Proposal # for Req #** | Notes |
|:------------|:--------------|:----------------------------------|:------|
| Contributor | authority | SP1 META\_R15 | new attribute |
| Contributor | display-seq | SP1 META\_R03 | new attribute |
| Contributor | type | SP1 META\_R03, SP1 META\_R04 | new attribute |

### dc:creator ###

| **Element** | **Attribute** | **Solution Proposal # for Req #** | Notes |
|:------------|:--------------|:----------------------------------|:------|
| Creator | authority | SP1 META\_R15 | new attribute |
| Creator | display-seq | SP1 META\_R03 | new attribute |
| Creator | type | SP1 META\_R03, SP1 META\_R04 | new attribute |

### dc:date ###

| **Element** | **Attribute** | **Solution Proposal # for Req #** | Notes |
|:------------|:--------------|:----------------------------------|:------|
| Date | authority | SP1 META\_R15 | new attribute |
| Date | event | SP1 META\_R15 | new defined value _meta-update_ |
| Date | id | SP1 META\_R15 | required attribute when _event="meta-update"_  |

## Meta ##

| **Element** | **Attribute** | **Solution Proposal # for Req #** | Notes |
|:------------|:--------------|:----------------------------------|:------|
| meta | alt | SP 2 META\_R07 | declare as allowed in `<meta />` |
| meta | date-ref | SP 1 META\_R15 | new attribute |
| meta | name | SP 1 META\_R15 | new defined value _meta-auth_ |
| meta | signature | SP 1 META\_R15 | new attribute |

## OPF ##

| **Element** | **Attribute** | **Solution Proposal # for Req #** | Notes |
|:------------|:--------------|:----------------------------------|:------|
| Cover |  | SP1 META\_R07 | new element |
| Cover | item | SP1 META\_R07 | new attribute |
| Cover | alt | SP1 META\_R07 | declare as allowed in `<meta />` |


# Attributes #

## Comments ##

(Name, Comment)