# frozen_string_literal: true

class CarWithBasicInfo
  attr_reader :release_year, :mileage

  def initialize(year, miles)
    @release_year, @mileage = year, miles
  end

  def average_mileage
    year_difference = Time.now.year - release_year
    return mileage / year_difference unless year_difference.zero?

    'Less than a year has passed'
  end
end

class CarWithExtendedInfo < CarWithBasicInfo
  attr_reader :number, :brand, :owner

  def initialize(number, brand, year, miles, surname)
    super(year, miles)
    @number, @brand, @owner = number, brand, surname
  end
end
