require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/card'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    refute_nil round
  end

  def test_guesses_has_value
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    refute_nil round
  end

  def test_guesses_starts_empty
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    expected = []
    actual = round.guesses
    assert_equal expected, actual
  end

  def test_guesses_holds_value
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    card_hash = {value: "3", suit: "Hearts"}
    round.record_guess(card_hash)

    expected = card_hash
    actual = round.guesses
    assert_equal expected, actual
  end

  def test_guess_is_formatted
    skip
  end

  def test_guesses_update
    skip
  end

end
