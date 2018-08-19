require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'


class DeckTest < Minitest::Test

  def test_holds_cards
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    expected = [card_1, card_2, card_3]
    actual = deck.cards
    assert_equal expected, actual
  end

  def test_holds_first
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    expected = card_1
    actual = deck.cards.first
    assert_equal expected, actual
  end

  def test_holds_last
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    expected = card_3
    actual = deck.cards.last
    assert_equal expected, actual
  end

  def test_number_of_cards
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    expected = 3
    actual = deck.count
    assert_equal expected, actual
  end

  def test_calculates_correct_values
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("10", "Clubs")
    card_3 = Card.new("Jack", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    deck = Deck.new([card_1, card_2, card_3, card_4])

    assert_equal 16, deck.calculate_absolute_value(card_1)
    assert_equal 10, deck.calculate_absolute_value(card_2)
    assert_equal 37, deck.calculate_absolute_value(card_3)
    assert_equal 53, deck.calculate_absolute_value(card_4)
  end


end
