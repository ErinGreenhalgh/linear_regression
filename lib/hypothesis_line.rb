class HypothesisLine
  attr_reader :theta0,
              :theta1

  def initialize(theta0, theta1)
    @theta0 = theta0
    @theta1= theta1
  end

  def line(x)
    theta0 + (theta1 * x)

  end

  # def square_root(x)
  #   theta0 + theta1*(Math.sqrt(x))
  # end

end
