require 'pry'
class Round
    attr_reader :deck, 
                :guesses,
                :number_correct

    def initialize(deck)
        @deck = deck
        @guesses = []
        @number_correct = 0
    end

    def current_card
        @deck.cards[guesses.count]
    end

    def record_guess(guess_hash) # {value: "3", suit: "Hearts"}
        guess_card = "#{guess_hash[:value]} of #{guess_hash[:suit]}"
        @new_guess = Guess.new(guess_card, current_card)
        @guesses <<  @new_guess

        if @new_guess.correct? == true
            @number_correct += 1
        end
    end

    def percent_correct
        @number_correct.to_f / @guesses.count.to_f * 100
    end
    
end