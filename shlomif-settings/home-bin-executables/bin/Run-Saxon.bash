#!/bin/bash
saxon -o:foo.xhtml -s:lib/docbook/5/xml/bad-elements.xml -xsl:lib/sgml/shlomif-docbook/xsl-5-stylesheets/shlomif-essays-5-xhtml-onechunk.xsl
