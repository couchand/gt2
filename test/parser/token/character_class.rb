require 'test/unit'
require_relative '../../../parser.rb'

module Gt2
module Parser

class BnfTest < Test::Unit::TestCase
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
