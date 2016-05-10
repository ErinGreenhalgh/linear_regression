require 'minitest/autorun'
require 'minitest/pride'
require './lib/hypothesis_line'

class HypothesisLineTest < Minitest::Test

  def setup
    @hp = HypothesisLine.new
  end

  def test_it_can_generate_a_random_theta0_between_negative_1_and_1
    assert >-1 && <1, @hp.theta0
  end

  def test_it_can_generate_a_random_theta1_between_negative_1_and_1
    assert >-1 && <1, @hp.theta1
  end

  def test_a_line_starts_out_with_a_random_theta0_and_theta1_from_negative_one_to_one


  end
end
