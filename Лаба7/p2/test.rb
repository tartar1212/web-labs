# frozen_string_literal: true

require './main'
require 'minitest/autorun'

class TestCars < Minitest::Test
  def test_hierarchy
    basic_car = CarWithBasicInfo.new(2019, 10_000)
    extended_car = CarWithExtendedInfo.new(101, 'Toyota', 2020, 1_000, 'Ivanov')
    assert_equal(basic_car.class, CarWithBasicInfo)
    assert_equal(basic_car.class.superclass, Object)
    assert_equal(extended_car.class, CarWithExtendedInfo)
    assert_equal(extended_car.class.superclass, CarWithBasicInfo)
  end

  def test_functionality
    basic_car = CarWithBasicInfo.new(2019, 10_000)
    extended_car = CarWithExtendedInfo.new(101, 'Toyota', 2018, 40_000, 'Ivanov')
    assert_equal(5_000, basic_car.average_mileage)
    assert_equal(extended_car.average_mileage, 13_333)
  end

  def test_current_year
    extended_car = CarWithExtendedInfo.new(101, 'Toyota', 2020, 40_000, 'Ivanov')
    assert_equal(extended_car.average_mileage, 40000)
  end
end
