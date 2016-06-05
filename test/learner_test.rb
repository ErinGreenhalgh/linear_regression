require 'minitest/autorun'
require 'minitest/pride'
require './lib/hypothesis_line'
require './lib/learner'

class LearnerTest < Minitest::Test

  def test_it_is_initialized_with_learning_rate_and_training_set
    training_set = [{i: 800, o: 1000}]
    learning_rate = 0.5
    learner = Learner.new(learning_rate, training_set)

    assert_equal 0.5, learner.learning_rate
    assert_equal [{i: 800, o: 1000}], learner.training_set
  end

  def test_it_returns_0_cost_with_linear_data
    training_set = [{i: 0, o: 0}, {i: 1, o: 1}]
    hypothesis = HypothesisLine.new(0, 1)
    learner = Learner.new(0, training_set)
    assert_equal 0, learner.cost(hypothesis)
  end

end
