class Round
  attr_reader :deck,
              :guesses

  attr_accessor :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @counter = 0
  end

  def current_card
    @deck.cards[0]
  end

  def record_guess(guess)
    @guesses << Guess.new("#{guess[:value]} of #{guess[:suit]}", current_card)
    @guesses.last
  end

  def number_correct
    @guesses.each do |guess|
      if guess.feedback == "Correct!"
        @counter += 1
      end 
    end
  end

end
