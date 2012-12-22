require 'test/unit'
require_relative '../../../parser.rb'

module Gt2
module Parser

class BnfTest < Test::Unit::TestCase
  def test_nonterminal
    input = 'foobar'
    parser = Bnf.parser

    tree = parser.parse input, { :root => :nonterminal }

    assert !tree.nil?, 'The nonterminal should parse'
    assert tree.is_a?(Node::Nonterminal), 'The resulting tree should be a nonterminal node'
    assert_equal input, tree.name
  end

  def test_nonterminal_bad_char
    input = 'foo:bar'
    parser = Bnf.parser

    assert_raises(Exception){ parser.parse input, { :root => :nonterminal } }
  end

  def test_terminal_double_quote_string
    string_val = "foobar"
    input = '"' + string_val + '"'
    parser = Bnf.parser

    tree = parser.parse input, { :root => :terminal }

    assert !tree.nil?, 'The quoted string terminal should parse'
    assert tree.is_a?(Node::TerminalLiteral), 'The resulting tree should be a terminal node'
    assert_equal string_val, tree.text_value
  end

  def test_terminal_double_quote_string_with_unescaped_quote
    input = '"foo"bar"'
    parser = Bnf.parser

    assert_raises(Exception){ parser.parse input, { :root => :terminal } }
  end

  def test_terminal_double_quote_string_with_escaped_quote
    input = '"foo\\"bar"'
    parser = Bnf.parser

    tree = parser.parse input, { :root => :terminal }

    assert !tree.nil?, 'The quoted string terminal should parse'
    assert tree.is_a?(Node::TerminalLiteral), 'The resulting tree should be a terminal node'
    assert_equal 'foo"bar', tree.text_value
  end

  def test_terminal_double_quote_string_with_escaped_backslash
    input = '"foo\\\\\\"bar"'
    parser = Bnf.parser

    tree = parser.parse input, { :root => :terminal }

    assert !tree.nil?, 'The quoted string terminal should parse'
    assert tree.is_a?(Node::TerminalLiteral), 'The resulting tree should be a terminal node'
    assert_equal 'foo\\"bar', tree.text_value
  end

  def test_terminal_single_quote_string
    string_val = "foobar"
    input = "'" + string_val + "'"
    parser = Bnf.parser

    tree = parser.parse input, { :root => :terminal }

    assert !tree.nil?, 'The quoted string terminal should parse'
    assert tree.is_a?(Node::TerminalLiteral), 'The resulting tree should be a terminal node'
    assert_equal string_val, tree.text_value
  end

  def test_terminal_single_quote_string_with_unescaped_quote
    input = "'foo'bar'"
    parser = Bnf.parser

    assert_raises(Exception){ parser.parse input, { :root => :terminal } }
  end

  def test_terminal_single_quote_string_with_escaped_quote
    input = "'foo\\'bar'"
    parser = Bnf.parser

    tree = parser.parse input, { :root => :terminal }

    assert !tree.nil?, 'The quoted string terminal should parse'
    assert tree.is_a?(Node::TerminalLiteral), 'The resulting tree should be a terminal node'
    assert_equal "foo'bar", tree.text_value
  end

  def test_terminal_single_quote_string_with_escaped_backslash
    input = "'foo\\\\\\'bar'"
    parser = Bnf.parser

    tree = parser.parse input, { :root => :terminal }

    assert !tree.nil?, 'The quoted string terminal should parse'
    assert tree.is_a?(Node::TerminalLiteral), 'The resulting tree should be a terminal node'
    assert_equal "foo\\'bar", tree.text_value
  end

  def test_terminal_character_class
    input = "[^-. a-zA-Z0-9$!^]"
    parser = Bnf.parser

    tree = parser.parse input, { :root => :terminal }

    assert !tree.nil?, 'The character class terminal should parse'
    assert tree.is_a?(Node::TerminalClass), 'The resulting tree should be a terminal node'
    assert_equal input, tree.expression, 'The character class should reflect the input'
  end

  def test_terminal_character_class_unescaped_bracket
    input = "[abc]def]"
    parser = Bnf.parser

    assert_raises(Exception){ parser.parse input, { :root => :terminal } }
  end

  def test_terminal_character_class_escaped_bracket
    input = "[abc\\]def]"
    parser = Bnf.parser

    tree = parser.parse input, { :root => :terminal }

    assert !tree.nil?, 'The character class terminal should parse'
    assert tree.is_a?(Node::TerminalClass), 'The resulting tree should be a terminal node'
    assert_equal input , tree.expression, 'The character class should reflect the input'
  end
end

end
end
