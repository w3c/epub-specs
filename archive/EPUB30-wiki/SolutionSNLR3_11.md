This page has the proposed solution for [SNL\_R13.11 "Expando Image Support",](StylingAndLayout#SNL_R3.11_Expando_Image_Support.md) from the [Styling and Layout Sub-group Page](StylingAndLayout.md).

NOTE: based on subgroup discussion this proposal can be considered retitled as " Ignore CSS class name alternative.

# designating elements as suitable for out-of-line display by a UA (zoomable) #

["OPS:Type",](ImplemenationProposalRoleOpsType.md) solution calls for a new attribute in our
namespace, e.g. "ops:type".

This proposal is to add "zoomable" to the list of predefined values for this attribute, with the proviso that it should appear only on elements of type "img", "iframe", "object", and "div".

UA conformance: UA may offer a UI affordance to enable a user to select a more prominent, out-of-flow display for elements of types that carry this attribute value, and should ignore any occurrence of this attribute value on other elements.

If the entire vocabulary predefined for OPS is informative rather than normative this value should be as well, if some values are normatively defined then it should be normative as well.