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

    def test_sort_method_returns_array
        # skip
        card_1 = Card.new("4","Hearts")
        card_2 = Card.new("Jack", "Clubs")
        card_3 = Card.new("5", "Diamonds")
        card_4 = Card.new("Ace", "Spades")
        card_5 = Card.new("Ace", "Diamonds")
        deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
       
        assert_instance_of Array, deck.sort
    end

    def test_returned_array_is_same_length
        # skip
        card_1 = Card.new("4","Hearts")
        card_2 = Card.new("Jack", "Clubs")
        card_3 = Card.new("5", "Diamonds")
        card_4 = Card.new("Ace", "Spades")
        card_5 = Card.new("Ace", "Diamonds")
        deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

        assert_equal deck.cards.count, deck.sort.count
    end

    def test_card_worth
        card_1 = Card.new("4","Clubs")
        card_2 = Card.new("4","Hearts")
        card_3 = Card.new("4","Diamonds")
        card_4 = Card.new("4","Spades")
        
        assert_equal 0, card_1.worth
        assert_equal 1, card_2.worth
        assert_equal 2, card_3.worth
        assert_equal 3, card_4.worth
    end

    def test_compare_card_worth
        card_1 = Card.new("4","Clubs")
        card_2 = Card.new("4","Hearts")
        card_3 = Card.new("4","Diamonds")
        card_4 = Card.new("4","Spades")

        assert_equal true, card_1.worth < card_2.worth
        assert_equal true, card_2.worth < card_3.worth
        assert_equal true, card_3.worth < card_4.worth
        assert_equal false, card_4.worth < card_1.worth
    end

    def test_card_face_value
        card_1 = Card.new("1","Clubs")
        card_2 = Card.new("2","Hearts")
        card_3 = Card.new("3","Diamonds")
        card_4 = Card.new("4","Spades")
        card_5 = Card.new("5","Clubs")
        card_6 = Card.new("6","Hearts")
        card_7 = Card.new("7","Diamonds")
        card_8 = Card.new("8","Spades")
        card_9 = Card.new("9","Clubs")
        card_10 = Card.new("10","Hearts")
        card_11 = Card.new("Jack","Diamonds")
        card_12 = Card.new("Queen","Spades")
        card_13 = Card.new("King","Clubs")
        card_14 = Card.new("Ace","Hearts")
      
        assert_equal 1, card_1.face_value
        assert_equal 2, card_2.face_value
        assert_equal 3, card_3.face_value
        assert_equal 4, card_4.face_value
        assert_equal 5, card_5.face_value
        assert_equal 6, card_6.face_value
        assert_equal 7, card_7.face_value
        assert_equal 8, card_8.face_value
        assert_equal 9, card_9.face_value
        assert_equal 10, card_10.face_value
        assert_equal 11, card_11.face_value
        assert_equal 12, card_12.face_value
        assert_equal 13, card_13.face_value
        assert_equal 14, card_14.face_value
        
    end

    def test_compare_face_value
        card_1 = Card.new("1","Clubs")
        card_2 = Card.new("2","Hearts")
        card_3 = Card.new("3","Diamonds")
        card_4 = Card.new("4","Spades")
        card_5 = Card.new("5","Clubs")
        card_6 = Card.new("6","Hearts")
        card_7 = Card.new("7","Diamonds")
        card_8 = Card.new("8","Spades")
        card_9 = Card.new("9","Clubs")
        card_10 = Card.new("10","Hearts")

        assert_equal true, card_1.face_value < card_2.face_value
        assert_equal true, card_2.face_value < card_3.face_value
        assert_equal true, card_3.face_value < card_4.face_value
        assert_equal true, card_4.face_value < card_5.face_value
        assert_equal true, card_5.face_value < card_6.face_value
        assert_equal true, card_6.face_value < card_7.face_value
        assert_equal true, card_7.face_value < card_8.face_value
        assert_equal true, card_8.face_value < card_9.face_value
        assert_equal true, card_9.face_value < card_10.face_value
    end


    def test_it_compares_face_cards
        card_1 = Card.new("Jack","Diamonds")
        card_2 = Card.new("Queen","Spades")
        card_3 = Card.new("King","Clubs")
        card_4 = Card.new("Ace","Hearts")

        assert_equal true, card_1.face_value < card_2.face_value
        assert_equal true, card_2.face_value < card_3.face_value
        assert_equal true, card_3.face_value < card_4.face_value
        assert_equal false, card_4.face_value < card_1.face_value
    end

    def test_resolve_value_tie_with_suit
        card_1 = Card.new("10","Spades")
        card_2 = Card.new("10","Diamonds")
        deck = Deck.new([card_1, card_2])

        assert_equal [card_2, card_1], deck.sort

        card_1 = Card.new("3","Hearts")
        card_2 = Card.new("3","Clubs")
        deck = Deck.new([card_1, card_2])

        assert_equal [card_2, card_1], deck.sort
    end

    def test_first_pair_of_cards
        card_1 = Card.new("4","Hearts")
        card_2 = Card.new("Jack", "Clubs")
        
        assert_equal true, card_1.face_value < card_2.face_value 
    end

    def test_sort_five_cards
        card_1 = Card.new("4","Hearts")
        card_2 = Card.new("Jack", "Clubs")
        card_3 = Card.new("5", "Diamonds")
        card_4 = Card.new("Ace", "Spades")
        card_5 = Card.new("Ace", "Diamonds")
        deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

        assert_equal [card_1, card_3, card_2, card_5, card_4], deck.sort
    end

end
