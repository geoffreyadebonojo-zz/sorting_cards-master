require 'pry'

require 'minitest/autorun'
require 'minitest/pride'

require './lib/card'
require './lib/deck'
require './lib/guess'
require './lib/round'

class RoundTest < Minitest::Test

    def test_it_exists
        # skip
        card_1 = Card.new("3","Hearts")
        card_2 = Card.new("4", "Clubs")
        deck = Deck.new([card_1, card_2])
        round = Round.new(deck)

        assert_instance_of Round, round
    end

    def test_round_holds_deck
        # skip
        card_1 = Card.new("3","Hearts")
        card_2 = Card.new("4", "Clubs")
        deck = Deck.new([card_1, card_2])
        round = Round.new(deck)   

        assert_equal deck, round.deck
    end

    def test_guesses_starts_empty
        # skip
        card_1 = Card.new("3","Hearts")
        card_2 = Card.new("4", "Clubs")
        deck = Deck.new([card_1, card_2])
        round = Round.new(deck)   

        assert_equal [], round.guesses
    end

    def test_current_card
        # skip
        card_1 = Card.new("3","Hearts")
        card_2 = Card.new("4", "Clubs")
        deck = Deck.new([card_1, card_2])
        round = Round.new(deck) 

        assert_equal card_1, round.current_card
    end

    def test_it_counts_guesses
        # skip
        card_1 = Card.new("3","Hearts")
        card_2 = Card.new("4", "Clubs")
        deck = Deck.new([card_1, card_2])
        round = Round.new(deck) 
        
        assert_equal 0, round.guesses.count

        round.record_guess({value: "4", suit: "Hearts"})

        assert_equal 1, round.guesses.count
    end

    def test_it_holds_card_value
        card = Card.new("5", "Hearts")
        guess = Guess.new("10 of Hearts", card)

        assert_equal guess.card, card
    end 

    def test_it_gives_feedback_when_guess_is_incorrect
        card_1 = Card.new("3","Hearts")
        card_2 = Card.new("4", "Clubs")
        deck = Deck.new([card_1, card_2])
        round = Round.new(deck) 
        round.record_guess({value: "4", suit: "Hearts"})

        assert_equal "Incorrect.", round.guesses.last.feedback
    end
    
    def test_gives_feedback_when_guess_is_correct
        card_1 = Card.new("3","Hearts")
        card_2 = Card.new("4", "Clubs")
        deck = Deck.new([card_1, card_2])
        round = Round.new(deck) 
        round.record_guess({value: "3", suit: "Hearts"})

        assert_equal "Correct!", round.guesses.last.feedback
    end

    def test_number_correct
        card_1 = Card.new("3","Hearts")
        card_2 = Card.new("4", "Clubs")
        deck = Deck.new([card_1, card_2])
        round = Round.new(deck) 
        guess = {value: "3", suit: "Hearts"}

        assert_equal 0, round.number_correct

        round.record_guess(guess)

        assert_equal 1, round.number_correct
    end

    def test_interaction_pattern

        card_1 = Card.new("3","Hearts")
        card_2 = Card.new("4", "Clubs")
        deck = Deck.new([card_1, card_2])
        round = Round.new(deck)
        
        assert_equal card_1, round.current_card
        assert_equal 0, round.guesses.count
        
        round.record_guess({value: "3", suit: "Hearts"})
        
        assert_equal 1, round.guesses.count
        
        assert_equal "Correct!", round.guesses.first.feedback
        assert_equal 1, round.number_correct
        
        assert_equal card_2, round.current_card
        
        round.record_guess({value: "Jack", suit: "Diamonds"})
        
        assert_equal 2, round.guesses.count
        
        assert_equal "Incorrect.", round.guesses.last.feedback
        assert_equal 1, round.number_correct
        assert_equal 50, round.percent_correct
    end
end