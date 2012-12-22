require_relative 'nodes.rb'

module Bnf

class Nonterminal < Treetop::Runtime::SyntaxNode
  def abstract
    Gt2::Node::Nonterminal.new text_value
  end
end

class DoublyQuotedString < Treetop::Runtime::SyntaxNode
  def abstract
    Gt2::Node::TerminalLiteral.new text_value.slice(1..-2).gsub(/\\"/,'"').gsub(/\\\\/,'\\')
  end
end

class SinglyQuotedString < Treetop::Runtime::SyntaxNode
  def abstract
    Gt2::Node::TerminalLiteral.new text_value.slice(1..-2).gsub(/\\'/,"'").gsub(/\\\\/,'\\')
  end
end

class CharacterClass < Treetop::Runtime::SyntaxNode
  def abstract
    Gt2::Node::TerminalClass.new text_value
  end
end

end
