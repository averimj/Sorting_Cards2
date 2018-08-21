require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/guess"
require "./lib/deck"
require "./lib/round"

class RoundTest < Minitest::Test
  def test_it_exist
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

  assert_instance_of Round, round
  end

  def test_it_has_a_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

  assert_equal deck, round.deck
  end

  def test_it_starts_an_empty_array_of_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_it_has_a_current_card
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal card_1, round.current_card
  end

  def test_it_can_record_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    guess = Guess.new("3 of Hearts", card_1)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    actual = round.record_guess({value: "3", suit: "Hearts"})

    assert_instance_of Guess, actual
    assert_equal guess.response, actual.response
  end

  def test_it_can_count_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    guess = Guess.new("3 of Hearts", card_1)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess({value: "3", suit: "Hearts"})

    assert_equal 1, round.guesses.count
  end

  def test_it_gives_feedback
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    guess = Guess.new("3 of Hearts", card_1)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    
    round.record_guess({value: "3", suit: "Hearts"})

    assert_equal "Correct!", round.guesses.first.feedback
  end


end
