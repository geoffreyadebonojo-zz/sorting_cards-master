require 'pry'

require './lib/card'
require './lib/guess'
require './lib/deck'

class Round
  attr_reader :deck, :guesses, :current_card
  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card = Card.new("Ace", "Spades")
  end

  def current_card

  end

  def record_guess(value_suit_hash)
    @value = value_suit_hash[:value]
    @suit = value_suit_hash[:suit]
    @guess = "#{@value} of #{@suit}"
    @guesses << Guess.new(@guess, @current_card)
  end

  def number_correct

  end

  def percent_correct

  end

end

card_1 = Card.new("3","Hearts")
card_2 = Card.new("4", "Clubs")
deck = Deck.new([card_1, card_2])
round = Round.new(deck)
card_hash_1 = {value: "3", suit: "Hearts"}
card_hash_2 = {value: "5", suit: "Hearts"}
round.record_guess(card_hash_1)
round.record_guess(card_hash_2)
most_recent = round.guesses.last
p most_recent.guess_value
p most_recent.guess_suit
