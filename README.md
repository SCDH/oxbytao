# oXbytao - *oXbyt*ei with *A*dd-*O*ns #

![release](https://github.com/scdh/oxbytao/actions/workflows/release.yml/badge.svg)
![tests](https://github.com/scdh/oxbytao/actions/workflows/test-main.yml/badge.svg)

## tl;dr ##

Install from [https://scdh.github.io/oxbytao/descriptor.xml](https://scdh.github.io/oxbytao/descriptor.xml).

STATE: development, experimental

## About oXbytao ##

oXbytao is [**oXbyt**ei](https://github.com/scdh/oxbytei) with **a**dd-**o**ns.

- CSS styles, that can simply be extended on a project level without
  writing your own framework
- some author mode actions that are too trivial or too biased to a
  certain markup style for
  oXbytei
  - highlight referenced text in anchor-based markup (e.g. the portion
    of the text referenced by an apparatus entry with external double
    end-point attached variant encoding)
  - append a `<rdg>` to an apparatus entry
  - delete an apparatus entry
  - `<note>`
  - `<sic>`
  - `<corr>`
  - wrap elements into `<choice>` and unwrap

## Requirements ##

- [oXygen](http:www.oxygenxml.com) >= 23.1
- [oXbytei](https://github.com/scdh/oxbytei)

## Installation ##

Installation is just as easy as the installation of
[oXbytei](https://github.com/SCDH/oxbytei#installation).  Just take
the following link instead:

[https://scdh.github.io/oxbytao/descriptor.xml](https://scdh.github.io/oxbytao/descriptor.xml)

## Customization ##

### CSS ###

oXbytao introduces the CSS styles **Collapsed** and **Expanded**, and
the additional styles **+Anchors**, **+Header** and **+Edit**. These
can be extended on a project level without writing your own
framework. There are some empty CSS files in the framework, that can
simply be replaced by an XML catalog:

- **common-project.css**: local CSS definitions used by all the styles
  in oXbytao. You can use this for adding your own project-wide font
  definitions etc.
- **collapsed-project.css**: local CSS definitions used in *Collapsed*
  style
- **expanded-project.css**: local CSS definitions used in *Expanded*
  style
- **anchors-project.css**: local CSS definitions used in *+Anchors*
  style
- **header-project.css**: local CSS definitions used in *+Header*
  style
- **edit-project.css**: local CSS definitions used in *+Edit* style



Note: If you want to re-define styles already defined, then you can
also replace files without the `-project` infix.


### XML catalog ###

Let's assame that you have an XML catalog file in
`resources/catalog.xml` in your oXygen project and a customized
CSS in `resources/css/common.css`. Then you should
put the following lines in the catalog file:

```{xml}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.1//EN" "http://www.oasis-open.org/committees/entity/release/1.1/catalog.dtd">
<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">

	<!-- redirect to local CSS -->
 	<uriSuffix uriSuffix="oxbytoa/css/common-project.css" uri="css/common.css"/>
	<uriSuffix uriSuffix="oxbytoa/css/common-project.css" uri="css/common.css"/>

</catalog>
```

You also have to activate the catalog file for your [oXygen
project](https://www.oxygenxml.com/doc/versions/23.1/ug-editor/topics/preferences-xml-catalog.html#preferences-xml-catalog__xml_catalog_resolve_schema).



# License #

Copyright (c) 2021 Christian Lück

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see
[http://www.gnu.org/licenses/](http://www.gnu.org/licenses/).
