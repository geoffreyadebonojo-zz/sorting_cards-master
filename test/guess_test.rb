require 'pry'

require 'minitest/autorun'
require 'minitest/pride'

require './lib/card'
require './lib/guess'

class GuessTest < Minitest::Test
   def test_holds_card # 1 
    card = Card.new("10", "Hearts")
    refute_nil card
   end

   def test_card_attributes # 2, 3
    card = Card.new("10", "Hearts")
    assert_equal "10", card.value
    assert_equal "Hearts", card.suit
   end 

   def test_guess_holds_card 
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal card, guess.card
   end

   def test_it_holds_guess_response # 7
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "10 of Hearts", guess.response
   end

   def test_it_can_tell_correct # 8, 14
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal true,  guess.correct?
    assert_equal "Correct!", guess.feedback
   end

    def test_it_can_tell_incorrect
    card = Card.new("10", "Hearts") # 10
    guess = Guess.new("2 of Diamonds", card) 
    assert_equal false,  guess.correct?
    assert_equal "Incorrect.", guess.feedback
    end

end