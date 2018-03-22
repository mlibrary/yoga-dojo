class BowlingGame
  def roll(ball)
    @rolls ||= []
    @rolls << ball
  end

  def score
    total = 0
    frame = Frame.new(@rolls,0)

    10.times do
      total += frame.score
      frame  = frame.successor
    end

    total
  end

  private
end

class Frame
  def initialize(rolls,index)
    @rolls = rolls
    @index = index
  end

  def [](offset)
    @rolls[index+offset]
  end

  def strike?
    self[0] == 10
  end

  def you_are_bad_at_bowling
    self[0] + self[1]
  end
  
  def strike_bonus
    successor[0] + successor[1]
  end

  def spare_bonus
    successor[0]
  end

  def spare?
    self[0] + self[1] == 10
  end

  def score
    if strike?
      10 + strike_bonus
    elsif spare?
      10 + spare_bonus
    else
      you_are_bad_at_bowling
    end
  end

  def successor
    if strike?
      Frame.new(@rolls,index + 1)
    else
      Frame.new(@rolls,index + 2)
    end
  end

  private

  attr_reader :index
end
