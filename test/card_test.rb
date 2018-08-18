require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test

  def test_holds_value
    card = Card.new("Ace", "Spades")
    expected = "Ace"
    actual = card.value
    assert_equal expected, actual
  end

  def test_holds_suit
    card = Card.new("Ace", "Spades")
    expected = "Spades"
    actual = card.suit
    assert_equal expected, actual
  end
end
