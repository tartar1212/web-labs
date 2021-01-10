# frozen_string_literal: true
# class cool
class Calc
  EPS_3 = 0.001
  EPS_4 = 0.0001
  PRECISE_VALUE = 0.5

  def calc(eps)
    calc_value = 0
    k = 1
    while (PRECISE_VALUE - calc_value).abs > eps
      calculation = (1.to_f / ((2 * k - 1) * (2 * k + 1))).to_f
      calc_value += calculation
      k += 1
    end
    p 'Result calculated in ' + k.to_s + ' iterations'
    p 'Calculated value: ' + calc_value.to_s + ' (precise value is 1)'
    calc_value
  end
end
