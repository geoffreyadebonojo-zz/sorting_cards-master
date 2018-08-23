require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

    def test_it_exists
        card_1 = Card.new("3","Hearts")
        card_2 = Card.new("4", "Clubs")
        card_3 = Card.new("5", "Diamonds")
        deck = Deck.new([card_1, card_2, card_3])
        
        assert_instance_of Deck, deck
        assert_equal deck.cards, [card_1, card_2, card_3]
    end

    def test_it_counts_cards
        card_1 = Card.new("3","Hearts")
        card_2 = Card.new("4", "Clubs")
        card_3 = Card.new("5", "Diamonds")
        deck = Deck.new([card_1, card_2, card_3])
        
        assert_equal 3, deck.cards.count
    end

    def test_sort_method_returns_array
        skip
        card_1 = Card.new("4","Hearts")
        card_2 = Card.new("Jack", "Clubs")
        card_3 = Card.new("5", "Diamonds")
        card_4 = Card.new("Ace", "Spades")
        card_5 = Card.new("Ace", "Diamonds")
        deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
       
        assert_instance_of Array, deck.sort
    end

    def test_returned_array_is_same_length
        skip
        card_1 = Card.new("4","Hearts")
        card_2 = Card.new("Jack", "Clubs")
        card_3 = Card.new("5", "Diamonds")
        card_4 = Card.new("Ace", "Spades")
        card_5 = Card.new("Ace", "Diamonds")
        deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

        assert_equal deck.cards.count, deck.sort.count
    end

    def test_card_order
        skip
        card_1 = Card.new("4","Hearts")
        card_2 = Card.new("Jack", "Clubs")
        card_3 = Card.new("5", "Diamonds")
        card_4 = Card.new("Ace", "Spades")
        card_5 = Card.new("Ace", "Diamonds")
        deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

        assert_equal [card_1, card_3, card_2, card_5, card_4], deck.sort
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

end