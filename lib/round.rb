class Round
  attr_reader :deck,
              :guesses

  attr_accessor :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards[0]
  end

  def record_guess(guess)
    @guesses << Guess.new("#{guess[:value]} of #{guess[:suit]}", current_card)
    @guesses.last
  end

  def number_correct
      counter = 0
    @guesses.each do |guess|
      if guess.feedback == "Correct!"
        counter += 1
      end
    end
    counter
  end

  def percent_correct
    (number_correct.to_f / @guesses.count) * 100
  end

end
