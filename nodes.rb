module Gt2
module Node

class Nonterminal
  def initialize(name)
    @name = name
  end

  attr_reader :name

  private

  attr_writer :name
end

class TerminalLiteral
  def initialize(text_value)
    @text_value = text_value
  end

  attr_reader :text_value

  private

  attr_writer :text_value
end

class TerminalClass
  def initialize(expression)
    @expression = expression
  end

  attr_reader :expression

  private

  attr_writer :expression
end

end
end
