class BowlingGame
  def roll(ball)
    @rolls ||= []
    @rolls << ball
  end

  def score
    total = 0
    index = 0

    10.times do
      if strike?(index)
        total += 10 + strike_bonus(index)
        index += 1
      elsif spare?(index)
        total += 10 + spare_bonus(index)
        index += 2
      else
        total += frame_total(index)
        index += 2
      end
    end

    total
  end

  private

  def strike?(index)
    @rolls[index] == 10
  end

  def frame_total(index)
    @rolls[index] + @rolls[index+1]
  end
  
  def strike_bonus(index)
    @rolls[index+1] + @rolls[index+2]
  end

  def spare_bonus(index)
    @rolls[index+2]
  end

  def spare?(index)
    frame_total(index) == 10
  end
end
