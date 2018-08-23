require 'pry'

require 'minitest/autorun'
require 'minitest/pride'

require './lib/card'

class CardTest < Minitest::Test

  def test_attributes
    card = Card.new("Ace", "Spades")
    assert_equal "Ace", card.value
    assert_equal "Spades", card.suit
  end

end