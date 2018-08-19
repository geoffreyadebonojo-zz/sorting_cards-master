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

  def calculate_absolute_value(card)
    #"2 of Clubs" = [2 + 0] = 2
    #"Ace of Clubs" = [14 + 0] = 14

    #"2 of Hearts" = [2 + 13] = 15
    #"Ace of Hearts" = [14 + 13] = 27

    #"2 of Diamonds" = [2 + 26] = 28
    #"Ace of Diamons" = [14 + 26] = 40

    #"2 of Spades" = [2 + 39] = 41
    #"Ace of Spades" = [14 + 39] = 53
    @rank = 0

    clubs = 0
    hearts = 13
    diamonds = 26
    spades = 39

    if card.suit == "Clubs"
      @rank += clubs
    elsif card.suit == "Hearts"
      @rank += hearts
    elsif card.suit == "Diamonds"
      @rank += diamonds
    elsif card.suit == "Spades"
      @rank += spades
    else
      puts "ERROR! Check the card suit."
    end

    jack = 11
    queen = 12
    king = 13
    ace = 14

    if card.value == "2"
      @rank += 2
    elsif card.value == "3"
      @rank += 3
    elsif card.value == "4"
      @rank += 4
    elsif card.value == "5"
      @rank += 5
    elsif card.value == "6"
      @rank += 6
    elsif card.value == "7"
      @rank += 7
    elsif card.value == "8"
      @rank += 8
    elsif card.value == "9"
      @rank += 9
    elsif card.value == "10"
      @rank += 10
    elsif card.value == "Jack"
      @rank += 11
    elsif card.value == "Queen"
      @rank += 12
    elsif card.value == "King"
      @rank += 13
    elsif card.value == "Ace"
      @rank += 14
    else
      puts "ERROR! Check card value"
    end

    return @rank
  end

  def compare_cards(card_1, card_2)
    sorted_cards = []

    card_1.value.length
    binding.pry






    if card_1.value < card_2.value
      sorted_cards << card_1
      sorted_cards << card_2
    end
    return sorted_cards
  end


  def sort
    # by values   2...10 < jack < queen < king < ace
    # by suit     clubs < daimonds < hearts < spades
    sorted_array = []


    # @cards[0].suit


  end


end


