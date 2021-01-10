# frozen_string_literal: true

# implements main controller
class AutomorphsController < ApplicationController
  def input; end

  def view
    input_s = params[:search_range]
    # checking only creation of views by default raises error of nil input
    if input_s.nil?
      res = 'error 1'
    elsif input_s.match?(/[^0-9 ]/)
      res = 'error 2'
      # res = input_s.to_s
    else
      res = parse_sequence(parse_input(input_s))
      res = 'error 3' if res.flatten.empty?
    end
    @result = res
  end
end

def square?(num)
  root = Math.sqrt(num)
  ((root - root.round).abs < 10e-5)
end

def parse_sequence(list)
  list.map { |elt| [elt, square?(elt)] }
      .slice_when { |elt1, elt2| elt1.last != elt2.last }
      .select { |grp| grp.first.last }
      .map { |grp| grp.map(&:first) }
end

def parse_input(input_string)
  input_string.strip.split.map(&:to_i)
end
