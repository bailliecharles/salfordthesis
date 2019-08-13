salfordthesis
============

This is a fork of the [University of Calgary](https://github.com/rzach/ucalgmthesis) thesis class created by Richard Zach. Many things have been changed here, but, generally, for detailed usage options head over there. 

`salford.cls` is a LaTeX class file that produces documents
according to the thesis guidelines of the [University of Salford
Doctoral School](pg.salford.ac.uk). It
uses the [`memoir`](https://ctan.org/pkg/memoir?lang=en) class, which
provides very powerful and flexible mechanisms for book design and
layout. All `memoir` commands for changing chapter and section
headings, page layout, fancy foot- and endnotes, typesetting poems,
etc., can be used. (Memoir is meant as a replacement for the standard
LaTeX classes, so all standard LaTeX commands such as `\chapter`,
`\section`, etc., still work.) Likewise, any of `memoir`'s class
options can be passed as options to `salfordthesis`, in particular
`12pt` to select 12 point type (11 point is the default).

License
-------

The files in this directory are provided under the terms of the MIT
License. `apalike-doi.bst` is provided under the terms of the LaTeX
Project Public License.

Usage
-----

Consult the file `example-thesis.tex` for an example thesis setup
with parts `\include`'d from separate files.



