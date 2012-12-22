require 'test/unit'
require_relative '../parser.rb'

module Gt2
module Parser

class BnfTest < Test::Unit::TestCase
  def test_token_nonterminal
    input = 'foobar'
    parser = Bnf.parser

    tree = parser.parse input, { :root => :nonterminal }

    assert !tree.nil?, 'The nonterminal should parse'
    assert tree.is_a?(Node::Nonterminal), 'The resulting tree should be a nonterminal node'
    assert_equal 'foobar', tree.name
  end

  def test_token_nonterminal_bad_char
    input = 'foo:bar'
    parser = Bnf.parser

    assert_raises(Exception){ parser.parse input, { :root => :nonterminal } }
  end

  def test_token_terminal_string
    input ='"foobar"'
    parser = Bnf.parser

    tree = parser.parse input, { :root => :terminal }

    assert !tree.nil?, 'The quoted string terminal should parse'
    assert tree.is_a?(Node::TerminalLiteral), 'The resulting tree should be a terminal node'
    assert_equal 'foobar', tree.text_value
  end

  def test_token_terminal_string_with_unescaped_quote
    input = '"foo"bar"'
    parser = Bnf.parser

    assert_raises(Exception){ parser.parse input, { :root => :terminal } }
  end

  def test_token_terminal_string_with_escaped_quote
    input ='"foo\\"bar"'
    parser = Bnf.parser

    tree = parser.parse input, { :root => :terminal }

    assert !tree.nil?, 'The quoted string terminal should parse'
    assert tree.is_a?(Node::TerminalLiteral), 'The resulting tree should be a terminal node'
    assert_equal 'foo"bar', tree.text_value
  end

  def test_token_terminal_string_with_escaped_backslash
    input ='"foo\\\\\\"bar"'
    parser = Bnf.parser

    tree = parser.parse input, { :root => :terminal }

    assert !tree.nil?, 'The quoted string terminal should parse'
    assert tree.is_a?(Node::TerminalLiteral), 'The resulting tree should be a terminal node'
    assert_equal 'foo\\"bar', tree.text_value
  end
end

end
end
