require 'pry'

require 'minitest/autorun'
require 'minitest/pride'

require './lib/guess'
require './lib/card'


class GuessTest < Minitest::Test

  def test_it_holds_whole_card
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    expected = card
    actual = guess.card
    assert_equal expected, actual
  end

  def test_holds_card_value
    card = Card.new("10", "Hearts")
    expected = "10"
    actual = card.value
    assert_equal expected, actual
  end

  def test_holds_card_suit
    card = Card.new("10", "Hearts")
    expected = "Hearts"
    actual = card.suit
    assert_equal expected, actual
  end

  def test_holds_guess
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    expected = "10 of Hearts"
    actual = guess.response
    assert_equal expected, actual
  end

  def test_correct_is_true_boolean
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    expected = TrueClass
    actual = guess.correct?.class
    assert_equal expected, actual
  end

  def test_correct_is_false_boolean
    card = Card.new("10", "Hearts")
    guess = Guess.new("9 of Hearts", card)
    expected = FalseClass
    actual = guess.correct?.class
    assert_equal expected, actual
  end

  def test_feedback_correct
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    expected = p "Correct!"
    actual = guess.feedback
    assert_equal expected, actual
  end

  def test_feedback_incorrect
    card = Card.new("10", "Hearts")
    guess = Guess.new("9 of Hearts", card)
    expected = p "Incorrect."
    actual = guess.feedback
    assert_equal expected, actual
  end

end
