# frozen_string_literal: true
require './calc.rb'
require './calc_enum.rb'
require './intprg.rb'
require 'minitest/autorun'

# Class for setting any tests on functions
class Tests < MiniTest::Test
  def setup; end

  def test_calc
    assert_in_delta(0.5, Calc.new.calc(Calc::EPS_3), Calc::EPS_3)
    assert_in_delta(0.5, Calc.new.calc(Calc::EPS_4), Calc::EPS_4)
  end

  def test_calc_enum
    assert_in_delta(0.5, CalcEnum.new.print(CalcEnum::EPS_3), Calc::EPS_3)
    assert_in_delta(0.5, CalcEnum.new.print(CalcEnum::EPS_4), Calc::EPS_4)
  end

  # :reek:UncommunicativeVariableName
  def test_intprg_lambda
    assert_equal(1.1265657101712514, Intprg.new.intprg_block(0, 1, 1000, &->(x) { (Math.exp(x)) / (x + 1) })) #TODO values
    assert_equal(0.668668, Intprg.new.intprg_block(0, 2, 1000, &->(x) { x * (x - 1) }))
  end

  # :reek:UncommunicativeVariableName
  def test_intprg_block
    assert_equal(1.1265657101712514, Intprg.new.intprg_block(0, 1, 1000) { |x| (Math.exp(x)) / (x + 1) })
    assert_equal(0.668668, Intprg.new.intprg_block(0, 2, 1000) { |x| x * (x - 1) })
  end

  def teardown; end
end
