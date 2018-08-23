require 'pry'
class Deck
    
    attr_reader :cards
    def initialize(cards)
        @cards = cards
    end

    def sort
        for i in 0...@cards.count-1
            if @cards[i].face_value > @cards[i+1].face_value
                @cards[i], @cards[i+1] = @cards[i+1], @cards[i]
            
            else @cards[i].face_value == @cards[i+1].face_value
                if @cards[i].worth > @cards[i+1].worth
                    @cards[i], @cards[i+1] = @cards[i+1], @cards[i]
                end
            end
        end
        
        @cards
    end
end