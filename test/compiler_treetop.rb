require 'test/unit'
require_relative '../compiler.rb'

module Gt2
module Compiler

class TreetopTest < Test::Unit::TestCase
  def test_compile_gt2
    input = File.open('bnf.bnf').read
    expected = File.open('bnf.treetop').read
    compiler = Treetop.compiler

    actual = compiler.compile input

    assert_equal expected, actual, 'We should eat our own dog food'
  end
end

end
end
