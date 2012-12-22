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

end
end
