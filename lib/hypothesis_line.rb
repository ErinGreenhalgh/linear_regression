class HypothesisLine
  attr_reader :theta0,
              :theta1

  def initialize(theta0, theta1)
    @theta0 = theta0
    @theta1= theta1
  end

  def generate_random_theta0
    rand(-1..1)
  end

  def generate_random_theta1
    rand(-1..1)
  end


end
