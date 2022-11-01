class Points
  attr_reader :card, :points
  TEN_SCORE = 10
  ACE_SCORE_HIGH = 11
  ACE_SCORE_LOW = 1  

  def initialize(card)
    @points = 0
    @card = card
  end

  def score_high
    if @card[0] == 'Q' or @card[0] == 'K' or @card[0] == 'J' or @card[0] == '1'
      @points = TEN_SCORE
    elsif @card[0] == 'A'
      @points = ACE_SCORE_HIGH
    else
      @points = @card[0].to_i
    end
  end

  def score_low
    if @card[0] == 'Q' or @card[0] == 'K' or @card[0] == 'J' or @card[0] == '1'
      @points = TEN_SCORE
    elsif @card[0] == 'A'
      @points = ACE_SCORE_LOW
    else
      @points = @card[0].to_i
    end
  end
end