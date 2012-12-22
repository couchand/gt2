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

Source files will be in a modified BNF form.  For instance,

	// sums.bnf
	sum ::= number "+" number
	sum ::= number
	number ::= [0-9]+

Note that there is just a bit of sugar on top of the
vanilla BNF specification.  Namely:

 * Character classes are allowed
 * Quantifiers are allowed
 * Several options in one production will be allowed
