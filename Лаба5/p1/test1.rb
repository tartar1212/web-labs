require 'minitest/autorun'
require_relative 'function1.rb'

class TestBlock < Minitest::Test
    def test_functions
      assert_equal a(5), -271.8343092407754
      assert_equal a(0), -2.0
    end
end