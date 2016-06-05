require './lib/hypothesis_line'

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
      acc + (hypothesis.line(ex[:i]) - ex[:o])**2
    end/(2*training_set.count.to_f)
  end

  def update_theta0(hypothesis)
    summation = training_set.reduce(0) do |acc, ex|
      acc + (hypothesis.line(ex[:i]) - ex[:o])
    end/(training_set.count.to_f)

    hypothesis.theta0 - learning_rate * summation
  end

  def update_theta1(hypothesis)
    summation = training_set.reduce(0) do |acc, ex|
      acc + (hypothesis.line(ex[:i]) - ex[:o])*ex[:i]
    end/(training_set.count.to_f)

    hypothesis.theta1 - learning_rate * summation
  end

  def decrease_cost(hypothesis)
    loop do
      cost(hypothesis)
      new_theta0 = update_theta0(hypothesis)
      new_theta1 = update_theta1(hypothesis)
      hypothesis = HypothesisLine.new(new_theta0, new_theta1)
    end
  end
end
