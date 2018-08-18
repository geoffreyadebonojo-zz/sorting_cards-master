require 'pry'
require './lib/card.rb'

class Deck
  attr_reader :cards, :count

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

end

# 
# card_1 = Card.new("3","Hearts")
# card_2 = Card.new("4", "Clubs")
# card_3 = Card.new("5", "Diamonds")
# deck = Deck.new([card_1, card_2, card_3])
