require_relative 'nodes.rb'

module Bnf

class Nonterminal < Treetop::Runtime::SyntaxNode
  def abstract
    Gt2::Node::Nonterminal.new text_value
  end
end

end
