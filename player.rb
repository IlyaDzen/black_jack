class Player
  attr_reader :balance
  
  def initialize
    @balance = 100
  end

  def bet_take
    @balance -= 10
  end

  def bet_win
    @balance += 20
  end

  def draw
    @balance += 10
  end
end
