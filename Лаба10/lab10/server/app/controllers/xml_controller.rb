# frozen_string_literal: true

# all server actions controller
class XmlController < ApplicationController
  def index
    input_s = params[:search_range]
    # checking only creation of views by default raises error of nil input
    if input_s.nil?
      res = 'error 1 - nil input'
    elsif input_s.match?(/[^0-9 -]/)
      res = 'error 2 - incorrect input'
    # res = input_s.to_s

    else
      res = parse_sequence(parse_input(input_s))
      res = 'error/code 3 - no sequences have been found' if res.flatten.empty?
    end

    if res.instance_of?(String)
      result = { message: res }
    else
      max = res.max_by(&:length)
      result = res.map { |elem| { subsequence: elem.to_s, length: elem.length } }
                  .append({ subsequence: 'max', length: 'length' })
                  .append({ subsequence: max.to_s, length: max.length })

    end

    respond_to do |format|
      format.xml { render xml: result.to_xml }
      format.rss { render xml: result.to_xml }
    end
  end
end

def square?(num)
  if num >= 0
    root = Math.sqrt(num)
    res = ((root - root.round).abs < 10e-5)
  else
    res = false
  end
  res
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
