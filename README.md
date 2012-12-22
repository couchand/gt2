gt2
===

Grammar Tool 2

 * Quick Start
 * Syntax
 * Abstract Syntax Tree

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

Abstract Syntax Tree
--------------------

The source and target languages are decoupled by
translating the parse tree into an abstract syntax tree.
Theoretically this should allow for novel source languages
to be developed, and support for new target languages
provided.

The Abstract tree is best described in code, but here is an
approximate translation into English:

 * A `Grammar` is a `List` of `Productions`,
 * A `Production` has a left-hand side, which is a
   `Nonterminal`, and a `List` of `Alternatives`,
 * An `Alternative` is a `List` of `Tokens`, each making up
   the right-hand side of a BNF rule,
 * A `Token` is either a `Terminal` or a `Nonterminal`, and
   possibly has a `Quantifier`,
 * A `Nonterminal` is just a name, a sequence of letters
   (and maybe numbers and some punctuation),
 * A `Terminal` is either a quoted string or a regular
   expression character class, and
 * A `Quantifier` is one of zero-or-one, zero-or-more, or
   one-or-more.
