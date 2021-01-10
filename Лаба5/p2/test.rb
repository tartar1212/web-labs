require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'logic'

class TestPart2 < Minitest::Test
  Chars = ('а'..'я').to_a

  def gen_word(hissing = false)
    word = (Chars.sample rand(1..6)).join ''
    word += (hissing ? 'щчшж' : 'крфнкстх').chars.sample
    word + 'онок'
  end

  def test_no_hissing
    20.times do
      assert (transform_word gen_word).end_with? 'ята'
    end
  end

  def test_hissing
    20.times do
      assert (transform_word gen_word(hissing: true)).end_with? 'ата'
    end
  end
end
