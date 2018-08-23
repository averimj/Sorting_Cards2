class Card
  attr_reader :value,
              :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def card_converter
     {"2" => 200,
      "3" => 300,
      "4" => 400,
      "5" => 500,
      "6" => 600,
      "7" => 700,
      "8" => 800,
      "9" => 900,
      "10" => 1000,
      "Jack" => 1100,
      "Queen" => 1200,
      "King" => 1300,
      "Ace" => 1400,
    }
  end

  def suit_converter
    suit_value = {   "Clubs" => 20,
      "Diamonds" => 30,
      "Hearts" => 40,
      "Spades" => 50
    }
  end

  def total_card_value
    card_converter[@value] + suit_converter[@suit]
  end
end
