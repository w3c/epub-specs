This page has potential solutions for [SNL\_R1.2 "Property value calculation based on environment",](StylingAndLayout#SNL_R1.2_Property_value_calculation_based_on_environment.md) from the [Styling and Layout Sub-group Page](StylingAndLayout.md).

# SNL\_R1.2\_PS1 Calc Value #

CSS3 introduces calc function that covers some of the needs:

http://www.w3.org/TR/css3-values/#calc

Example:

```

.foo {
    margin-left: calc(20% + 2em);
    width: calc(60% - 4em);
}
```

Pro:
  * aligned with CSS current direction
  * implemented in Gecko as -moz-calc

Cons:
  * very simplistic: functions like floor or max are required
  * no way to name values, every calculation is isolated
  * not widely implemented
  * hard to implement: requires calculation at the time used property values are calculated, cannot be implemented with a script

# SNL\_R1.2\_PS2 EPUB-specific own syntax, implementable with a script #

Exact syntax can be discussed, but something like that can easily be implemented in JavaScript for browser-based systems (and, of course, directly in C++):

```

@epub-styles {

   @define {
      guide1: expr(ceil(20% + 2em));
      guide2: expr(floor(80% - 2em));
   }

   .foo {
       margin-left: expr(guide1);
       width: expr(guide2 - guide1);
   }
}

```

Pros:
  * we can get any feature we need
  * can define reusable values instead of copy-and-pasting code around
  * easy to implement: all calculations are done at viewport context and converted to pixels

Cons:
  * not compatible with anything else