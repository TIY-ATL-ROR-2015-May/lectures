   class Deck

#    attr_reader :shuffle_count

    include Enumerable

    def initialize
#      @shuffle_count = 0
      @cards = []
      RANKS.product(SUITS).each do |rank, suit|
        @cards << Card.new(rank, suit)
      end

      # @cards = RANKS.product(SUITS).map { |r, s| Card.new(r, s) }
      # SUITS.each do |suit|
      #   RANKS.each do |rank|
      #     # @cards << [rank, suit]
      #     @cards << Card.new(rank, suit)
      #   end
      # end
    end

    def each
      @cards.each { |card| yield(card) }
    end

    def shuffle!
      # @shuffle_count += 1
      # self.shuffle!
      @cards.shuffle!
    end

    def count
      @cards.length
    end

    def draw(n)
      result = []
      n.times do
        result << @cards.shift
      end
      result
    end

    def peek
      @cards[0]
    end

  end
