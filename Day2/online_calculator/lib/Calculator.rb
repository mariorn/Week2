class Calculator
  attr_reader :param1, :param2
  def initialize(param1, param2)
    @param1 = param1
    @param2 = param2
  end

  def get_add
    param1 + param2
  end

  def get_sub
    param1 - param2
  end

  def get_mul
    param1 * param2
  end

  def get_div
    param1 / param2
  end


end