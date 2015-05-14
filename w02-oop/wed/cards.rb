require 'pry'

module IronYardGames
  class Card

  RANKS = (2..10).to_a + [:J, :Q, :K, :A]
  SUITS = [:diamonds, :clubs, :spades, :hearts]

  RANK_VALUES = {J: 11, Q: 12, K: 13, A: 14}

  # attr_reader :rank
  # attr_writer :rank
  attr_reader :rank, :suit
  include Comparable

  def initialize(rank=nil, suit=nil)
    @rank = rank || RANKS.sample
    @suit = suit || SUITS.sample
  end

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
end
