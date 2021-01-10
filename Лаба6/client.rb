# frozen_string_literal: true
require './calc.rb'
require './calc_enum.rb'
require './intprg.rb'

puts 'Enter function you want to execute: calc / calc_enum / intprg?'
arg = gets.chomp

case arg
when 'calc'
  puts 'choose precision: 10^-3 or 10^-4'
  case gets.chomp
  when '-3'
    Calc.new.calc(Calc::EPS_3)
  when '-4'
    Calc.new.calc(Calc::EPS_4)
  else
    p 'invalid input'
  end

when 'calc_enum'
  puts 'choose precision: 10^-3 or 10^-4'
  case gets.chomp
  when '-3'
    CalcEnum.new.print(CalcEnum::EPS_3)
  when '-4'
    CalcEnum.new.print(CalcEnum::EPS_4)
  else
    p 'invalid input'
  end

when 'intprg'
  puts 'block / lambda?'
  case gets.chomp
  when 'block'
    puts '"exp" one / "not_exp" one'
    case gets.chomp
    when 'exp'
      Intprg.new.intprg_block(0, 1, 1000) do |x|
        (Math.exp(x)) / (x + 1)
      end
    when 'not_exp'
      Intprg.new.intprg_block(0, 2, 1000) do |x|
        x * (x - 1)
      end
    else
      p 'invalid input'
    end
  when 'lambda'
    puts '"exp" one / "not_exp" one'
    case gets.chomp
    when 'exp'
      Intprg.new.intprg_block(0, 1, 1000, &->(x) { (Math.exp(x)) / (x + 1) })
    when 'not_exp'
      Intprg.new.intprg_block(0, 2, 1000, &->(x) { x * (x - 1) })
    else
      p 'invalid input'
    end

  else
    p 'invalid input'
  end
else
  p 'invalid input'
end
