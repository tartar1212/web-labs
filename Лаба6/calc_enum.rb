# frozen_string_literal: true
# class cool
class CalcEnum
  EPS_3 = 0.001
  EPS_4 = 0.0001
  PRECISE_VALUE = 0.5

  def print(eps)
    p 'Calculation:'
    calc_arr = CalcEnum.new.calc_enum.find do |calc_value|
      (CalcEnum::PRECISE_VALUE - calc_value).abs < eps * 0.1
    end
    puts calc_arr
    puts 'Precise value of series: ' + PRECISE_VALUE.to_s
    calc_arr
  end

  def calc_enum
    Enumerator.new do |yielded|
      calc_value = 0
      k = 1

      loop do
        yielded.yield calc_value
        calculation = (1.to_f / ((2 * k - 1) * (2 * k + 1))).to_f
        calc_value += calculation
        k += 1
      end

      p calc_value
    end
  end
end
