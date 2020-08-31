This page has potential solutions for [SNL\_R1.5 "Selection of Styles for Various User Settings"](StylingAndLayout#SNL_R1.5_Selection_of_Styles_for_Various_User_Settings.md) from the [Styling and Layout Sub-group Page](StylingAndLayout.md).

# SNL\_R1.5\_PS1 Custom Media Queries #

Additional media queries can be added for user selected states. For instance to differentiate vertical and horizontal writing modes we might have:
```
@media (-idpf-user-vertical-text) {
	p {margin-left: 1em}
}

@media not (-idpf-user-vertical-text) {
	p {margin-top: 1em}
}
```

An epub3 reading system would choose the correct styles based on the value of the user setting, while a compliant user agent (not a reading system) would choose the second set of styles based on the fallback rules for processing unknown media queries.

Alternatively, we could use a single feature (say, "-idpf-user") with values for the various user settings.

Pros:
  1. Uses an existing mechanism with known fallback behavior
  1. Mixes well with other styles, has well-defined interaction with CSS
  1. Extensible. We can provide any features we need, and we can craft the features so fallbacks provide reasonable results.

Cons:
  1. It is not clear that adding our own features is considered proper (the media query spec doesn't seem to address this).
  1. Adding a lot of features may be cumbersome, and it may be difficult (or impossible) to adequately list all the user features.

# SNL\_R1.5PS2 Specific Style Sheets #

Individual style sheets could be marked using the alternate style sheet method, discussed in more detail at http://fantasai.inkedblade.net/style/specs/altss-tags/ . For example, we for night mode we might have:

```
<link rel="stylesheet" href="nightmode.css" class="night" />
```

Or, for two distinct day/night mode stylesheets:

```
<link rel="stylesheet" href="daymode.css" class="day" title="todmode" />
<link rel="alternate" href="nightmode.css" class="night" title="todmode" />
```

Pros:
  1. Uses existing style inclusion mechanism
  1. Alternate style sheets have existed since html4
  1. Consistent with similar vertical/horizontal proposal from EGLS

Cons:
  1. Not very granular - can not be used to handle magnification
  1. May confuse existing reading systems that don't understand the use of alternate style sheets