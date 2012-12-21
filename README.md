gt2
===

Grammar Tool 2

Quick Start
-----------

Produce ANTLR grammar files with:

	thor gt2:antlr GRAMMAR

Produce Treetop grammar files with:

	thor gt2:treetop GRAMMAR

Syntax
------

Source files will be in BNF form.  For instance,

	// sums.bnf
	sum := number "+" number
	sum := number
	number := [0-9]+
