require 'pry'
class Card
  attr_reader :value, :suit
  def initialize(value, suit)
      @value = value
      @suit = suit
  end

  def worth
    if @suit == "Clubs"
      0
    elsif @suit == "Hearts"
      1
    elsif @suit == "Diamonds"
      2
    elsif @suit == "Spades"
      3
    end
  end

  def face_value
    values_hash = {"1" => 1,
                  "2" => 2,
                  "3" => 3,
                  "4" => 4,
                  "5" => 5,
                  "6" => 6,
                  "7" => 7,
                  "8" => 8,
                  "9" => 9,
                  "10" => 10,
                  "Jack" => 11,
                  "Queen" => 12,
                  "King" => 13,
                  "Ace" => 14}

    return values_hash[@value]
  end
end