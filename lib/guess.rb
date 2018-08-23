require 'pry'
class Guess
  attr_reader :guess, :card
  def initialize(guess, card)
    @card = card 
    @guess = guess # "10 of hearts"
  end

  def response
    @guess 
  end

  def correct?
    guess_string = "#{@card.value} of #{@card.suit}"
    if guess_string == @guess
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      "Correct!"
    elsif correct? == false
      "Incorrect."
    end
  end
end

