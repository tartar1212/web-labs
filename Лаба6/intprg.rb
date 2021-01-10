# frozen_string_literal: true
# class trap
class Intprg
  def intprg_block(a, b, n)
    sum = 0
    dx = (b - a).to_f / n
    (n + 1).times do |i|
      sum += yield(a + dx * i)
    end
    area = (b - a).to_f / n * sum
    p area
    area
  end
end
