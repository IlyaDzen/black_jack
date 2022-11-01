require_relative 'deck'
require_relative 'player'
require_relative 'points'

puts 'Your balance is 100$, choose your name to start game!'
name = gets.to_s
puts "Hello, #{name.chomp}."

@player = Player.new

def designation
  @deck = Deck.new
  @deck.deck_create
  @player.bet_take
  puts "Your balance is #{@player.balance}$"
  player_cards
  player_points
  dealer_cards
  dealer_points
end

def new_game
  designation
  puts 'Press 1 to pass'
  puts 'Press 2 to add card'
  enter_index = gets.to_i
  if enter_index == 1
    pass
  elsif enter_index == 2
   add_card
  end
end

def add_card
  random_player_card
  points_card3 = Points.new(@player_card3)
  if @player_points < 11
    points_card3.score_high
  else 
    points_card3.score_low
  end
  @player_points += points_card3.points
  puts "Your points is #{@player_points}"
  pass
end

def random_player_card
  random = rand(@deck.deck.length)
  @player_card3 = @deck.deck[random]
  @deck.deck.delete_at(random)
  puts "Your cards: #{@player_card1}, #{@player_card2}, #{@player_card3}"
end

def pass
  if @dealer_points < 17
    random_dealer_card
    points_card3 = Points.new(@dealer_card3)
    points_card3.score_low if @dealer_points >= 11
    points_card3.score_high if @dealer_points < 11
    @dealer_points += points_card3.points
    open_cards
  else
    open_cards
  end
end

def random_dealer_card
  random = rand(@deck.deck.length)
  @dealer_card3 = @deck.deck[random]
  @deck.deck.delete_at(random)
end

def player_cards
  random1 = rand(@deck.deck.length)
  @player_card1 = @deck.deck[random1]
  @deck.deck.delete_at(random1)

  random2 = rand(@deck.deck.length)
  @player_card2 = @deck.deck[random2]
  @deck.deck.delete_at(random2)
end

def player_points
  points_card1 = Points.new(@player_card1)
  points_card1.score_high

  points_card2 = Points.new(@player_card2)
  if @player_card1[0] != 'A'
    points_card2.score_high
  else 
    points_card2.score_low
  end

  @player_points = points_card1.points + points_card2.points
  puts
  puts "Your cards: #{@player_card1}, #{@player_card2}"
  
  puts "Your points is #{@player_points}"
  puts

  @player_points = points_card1.points + points_card2.points
end

def dealer_cards
  random3 = rand(@deck.deck.length)
  @dealer_card1 = @deck.deck[random3]
  @deck.deck.delete_at(random3)

  random4 = rand(@deck.deck.length)
  @dealer_card2 = @deck.deck[random4]
  @deck.deck.delete_at(random4)
end

def dealer_points
  points_d_card1 = Points.new(@dealer_card1)
  points_d_card1.score_high

  points_d_card2 = Points.new(@dealer_card2)
  if @dealer_card1[0] != 'A'
    points_d_card2.score_high
  else 
    points_d_card2.score_low
  end

  @dealer_points = points_d_card1.points + points_d_card2.points

  puts "Dealer cards: * *"
  puts
end


def open_cards
  puts "Dealer cards: #{@dealer_card1}, #{@dealer_card2}, #{@dealer_card3}"
  puts "Dealer points #{@dealer_points}"

  if @player_points > 21
    puts '---------YOU LOST---------'
    puts "Your balance: #{@player.balance}$"
  elsif @player_points <= 21 || @player_points <= 21 and @dealer_points > 21
    puts '---------YOU WIN----------'
    @player.bet_win
    puts "Your balance: #{@player.balance}$"
  elsif @player_points == @dealer_points
    puts '-----------DRAW-----------'
    @player.draw
    puts "Your balance: #{@player.balance}$"
  end


  puts 
  puts 'Press 1 to play again'
  puts 'Press any key to exit'

  enter_index = gets.to_i
  if enter_index == 1
    new_game
  end
end

new_game



