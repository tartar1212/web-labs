# frozen_string_literal: true

require 'test_helper'

# impements autotests class
class AutomorphsControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get automorphs_input_url
    assert_response :success
  end

  test 'should get view' do
    get automorphs_view_url
    assert_response :success
  end

  test 'should get parsed seq' do
    squares = [1, 4, 9, 16, 25, 36, 49]
    not_squares = [3, 5, 7, 8, 10, 11, 12, 13, 14, 15]
    right_seq = [].append(squares.sample(rand(1..5))).append(squares.sample(rand(1..5))).append(squares.sample(rand(1..5)))
    search_seq = [].append(right_seq[0])
        .append(not_squares.sample(rand(1..5)))
        .append(right_seq[1])
        .append(not_squares.sample(rand(1..5)))
        .append(right_seq[2])
    get automorphs_view_url, params: { search_range: search_seq.flatten.join(" ") }
    assert_equal assigns[:result], right_seq
  end

  test 'should get empty for 3 ,5 , 7' do
    get automorphs_view_url, params: { search_range: '3 5 7' }
    assert_equal assigns[:result], 'error 3'
  end

  test 'should get incorrect msg for letters' do
    get automorphs_view_url, params: { search_range: 'hrshrshs' }
    assert_equal assigns[:result], 'error 2'
  end

  test 'should get empty for empty input' do
    get automorphs_view_url, params: { search_range: '' }
    assert_equal assigns[:result], 'error 3'
  end
end
