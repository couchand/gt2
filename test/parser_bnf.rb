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
end

end
end
