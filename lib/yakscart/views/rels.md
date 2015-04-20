This API uses following [RFC5988](http://tools.ietf.org/html/rfc5988) style link relations

## Standard rels

These rels are part of the
[IANA](http://www.iana.org/assignments/link-relations/link-relations.xhtml)
or [Microformats](http://microformats.org/wiki/existing-rel-values)
official registry of rel values.

{: id="self"}
* self

Links back to the current resource.

## Custom rels

Because they are non-standard rels, they need to be URI's. They are formed by prefixing the following keywords with `https://yakscart.herokuapp.com/rels#`

{: id="cart"}
* cart

Links or embeds the current user's shopping cart.

{: id="products"}
* products

Use on: api root. Links to a list of all products.

{: id="product"}
* product

Used on: `line_item`, get the product of this line item.

{: id="line_items"}
* line_items

Used on: `cart`, to embed the line item collection that the cart consists of.
