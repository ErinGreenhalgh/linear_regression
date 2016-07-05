require './lib/hypothesis'

class Learner
  attr_reader :learning_rate, :training_set

  def initialize(learning_rate, training_set)
    @learning_rate = learning_rate
    @training_set = training_set
  end

  def random_theta
    rand(-1..1)
  end

  def cost(hypothesis)
    training_set.reduce(0) do |acc, ex|
      acc + (hypothesis.function(ex[:i]) - ex[:o])**2
    end/(2*training_set.count.to_f)
  end

  def update_theta0(hypothesis)
    summation = training_set.reduce(0) do |acc, ex|
      acc + (hypothesis.function(ex[:i]) - ex[:o])
    end / (training_set.count.to_f)

    hypothesis.theta0 - learning_rate * summation
  end

  def update_theta1(hypothesis)
    summation = training_set.reduce(0) do |acc, ex|
      acc + (hypothesis.function(ex[:i]) - ex[:o]) * Math.sqrt(ex[:i])
     end/(training_set.count.to_f)

    hypothesis.theta1 - learning_rate * summation
  end

  def decrease_cost(hypothesis)
    new_theta0 = 0
    new_theta1 = 0
    10000.times do
      cost(hypothesis)
      new_theta0 = update_theta0(hypothesis)
      new_theta1 = update_theta1(hypothesis)
      hypothesis = Hypothesis.new(new_theta0, new_theta1)
    end
    [new_theta0, new_theta1]
  end
end
