require 'minitest/autorun'
require 'minitest/pride'
require './lib/hypothesis_line'

class HypothesisLineTest < Minitest::Test

  def test_it_takes_in_theta0_and_theta1
    hp = HypothesisLine.new(0.5, 0.4)
    assert_equal 0.5, hp.theta0
    assert_equal 0.4, hp.theta1
  end

end
