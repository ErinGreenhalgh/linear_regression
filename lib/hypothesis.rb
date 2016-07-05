class Hypothesis
  attr_reader :theta0,
              :theta1

  def initialize(theta0, theta1)
    @theta0 = theta0
    @theta1= theta1
  end

  def function(x)
    theta0 + theta1*(Math.sqrt(x))
  end

end
