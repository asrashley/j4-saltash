# saltash
"Saltash" Joomla 4 template

## Introduction
It provides a basic responsive Boostrap 5 template. It requires CSS grid layout support, which is
supported by [most modern browsers](https://caniuse.com/?search=grid).

## History
This Joomla 4 template was initially based upon the [Cassiopeia](https://github.com/joomla/cassiopeia)
and [Mariela-Spoltore](https://github.com/koenVDZ/Mariela-Spoltore_template_Joomla4) templates.

## Building from source code
Building this template requires:
* [sass compiler](https://sass-lang.com/install/)
* [yuicompressor](https://yui.github.io/yuicompressor/)
* gzip
* make
* zip

```sh
make
make zip
```

## Installation
Use the standard Joomla install system to install saltash.zip

## Template Options
### Basic Options
Site logo
Site heading
Site sub-heading
Site's copyright holder

## Advanced Options
Which fonts to load
Which fonts to use for:
* site title
* headers
* body text

## Modifying Colour Scheme
The [colors_standard.scss](media/scss/global/colors_standard.scss) controls the primary colours used
for elements in the template.

The [user.scss](media/scss/user.scss) file allows fine-grained control of each HTML element.
