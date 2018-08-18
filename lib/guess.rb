class Guess
  attr_reader :card, :guess_value, :guess_suit

  def initialize(guess, card)
    @guess = guess
    @card = card

    @guess_value = @guess.split(" ")[0]
    @guess_suit = @guess.split(" ")[2]
    @check = @guess_value == @card.value && @guess_suit == @card.suit
  end

  def response
    @guess
  end

  def correct?
    @check
  end

  def feedback
    if @check == true
      p "Correct!"
    else
      p "Incorrect."
    end
  end
end
