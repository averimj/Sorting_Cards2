require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/guess"

class GuessTest < Minitest::Test
  def test_it_exist
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_instance_of Guess, guess
  end

  def test_it_has_attriutes
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal card, guess.card
    assert_equal "10 of Hearts", guess.response
  end

  def test_guess_is_true
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert guess.correct?
  end


  def test_feedback_is_correct
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal "Correct!", guess.feedback
  end

  def test_response_has_different_attributes
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)

    assert_equal "2 of Diamonds", guess.response
  end

  def test_guess_is_false
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)

    refute guess.correct?
  end

  def test_feedback_is_incorrect
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)

    assert_equal "Incorrect.", guess.feedback
  end

end
