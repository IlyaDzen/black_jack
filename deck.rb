class Deck
	attr_accessor :numbers, :suits, :deck
	
	def initialize
		@deck = []
		@numbers = %w[2 3 4 5 6 7 8 9 10 J Q K A]
		@suits = %w[♣ ♠ ♥ ♦]
	end

	def deck_create
		@numbers.each do |i| 
			@suits.length.times { |n| @deck.push(i + @suits[n - 1]) } 
		end
	end
end