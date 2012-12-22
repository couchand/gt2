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
end

end
end
