require 'pry'

module IronYardGames

  RANKS = (2..10).to_a + [:J, :Q, :K, :A]
  SUITS = [:diamonds, :clubs, :spades, :hearts]

  class Card

    RANK_VALUES = {J: 11, Q: 12, K: 13, A: 14}

    # attr_accessor :rank
    # attr_writer :suit
    attr_reader :rank, :suit
    include Comparable

    def initialize(rank=nil, suit=nil)
      @rank = rank || RANKS.sample
      @suit = suit || SUITS.sample
    end

    protected
    def value
      val = RANK_VALUES[self.rank]
      val ||= self.rank
    end

    def <=>(other)
      self.value <=> other.value
    end

    # def rank
    #   @rank
    # end

    # def change_rank(new_rank)
    #   @rank = new_rank
    # end

    # def rank=(new_rank)
    #   @rank = new_rank
    # end

    # def suit
    #   @suit
    # end
  end

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
end
