require 'minitest/autorun'
require 'minitest/pride'
require './lib/hypothesis'

class HypothesisTest < Minitest::Test

  def test_it_takes_in_theta0_and_theta1
    hp = Hypothesis.new(1, 2)
    assert_equal 1, hp.theta0
    assert_equal 2, hp.theta1
  end

  def test_it_generates_a_line
    hp = Hypothesis.new(1, 2)
    assert_equal 5, hp.function(4)
  end

end
