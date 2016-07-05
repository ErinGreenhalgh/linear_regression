require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/hypothesis'
require './lib/learner'

class LearnerTest < Minitest::Test

  def test_it_is_initialized_with_learning_rate_and_training_set
    training_set = [{i: 800, o: 1000}]
    learning_rate = 0.5
    learner = Learner.new(learning_rate, training_set)

    assert_equal 0.5, learner.learning_rate
    assert_equal [{i: 800, o: 1000}], learner.training_set
  end

  def test_it_returns_0_cost_with_data_that_exactly_fit_the_sqaure_root_function
    training_set = [{i: 0, o: 0}, {i: 1, o: 1}, {i: 4, o: 2}]
    hypothesis = Hypothesis.new(0, 1)
    learner = Learner.new(0, training_set)
    assert_equal 0, learner.cost(hypothesis)
  end

  def test_it_returns_same_theta0_and_theta1_with_data_that_exactly_fit_the_function
    training_set = [{i: 0, o: 0}, {i: 1, o: 1}, {i: 4, o: 2}]
    hypothesis = Hypothesis.new(0, 1)
    learner = Learner.new(0.5, training_set)
    assert_equal [0, 1], learner.decrease_cost(hypothesis)
  end

  def test_it_does_something_when_given_only_one_data_point
    skip
    training_set = [{i: 0, o: 2}]
    hypothesis = Hypothesis.new(0, 1)
    learner = Learner.new(0.01, training_set)
    assert_equal [0, 1], learner.decrease_cost(hypothesis)
  end

  def test_it_does_something_when_given_only_two_data_points
    skip
    training_set = [{i: 0, o: 0}, {i: 1, o: 1}]
    hypothesis = Hypothesis.new(0, 1)
    learner = Learner.new(0.5, training_set)
    assert_equal [0, 1], learner.decrease_cost(hypothesis)
  end

end
