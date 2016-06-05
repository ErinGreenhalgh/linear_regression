require './lib/hypothesis_line'

# given a test data set
# and a learning rate
# and a random theta0 and theta1 => random line
#1. check how bad we did (cost function)
#2. then keep updating the theta1 and theta0 until cost levels out
# also want to set some kind of parameters for it to stop

class Learner
  attr_reader :learning_rate, :training_set

  def initialize(learning_rate, training_set)
    @learning_rate = learning_rate
    @training_set = training_set
  end

  def random_theta
    rand(-1..1)
  end

  # def line
  #   HypothesisLine.new()
  # end

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

  # d/dtheta0 (theta0 + theta1 * xi - yi) ** 2
  #           2*(theta0 + theta1*xi - yi) * (1 + 0 - 0)
  #
  #           sum ( theta0 + theta1*xi - yi) /n

  # d/dtheta1 (theta0 + theta1 * xi - yi) ** 2
  #           2*(theta0 + theta1*xi - yi) * (0 + 1*xi - 0)


  def update_theta1(hypothesis)
    summation = training_set.reduce(0) do |acc, ex|
      acc + (hypothesis.line(ex[:i]) - ex[:o])*ex[:i]
    end/(training_set.count.to_f)

    hypothesis.theta1 - learning_rate * summation
  end

  def decrease_cost(hypothesis)
    loop do
      p cost(hypothesis)
      p "t0: #{new_theta0 = update_theta0(hypothesis)}"
      p new_theta1 = update_theta1(hypothesis)
      hypothesis = HypothesisLine.new(new_theta0, new_theta1)
    end

    # if its pretty bad then we'll determine new theta0 and theta1
  end





end

p "hey"
