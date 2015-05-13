require 'pry'

class Card
  RANKS = (2..10).to_a + [:J, :Q, :K, :A]
  SUITS = [:spades, :diamonds, :hearts, :clubs]

  include Comparable

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    case rank
    when :K
      13
    when :Q
      12
    when :J
      11
    when :A
      1
    else
      rank
    end
  end

  def <=>(other)
    self.value <=> other.value
  end

  def to_s
    "The #{self.rank} of #{self.suit}"
  end

  def self.suits
    SUITS
  end
end

class Deck
  include Enumerable

  # Two ways to `each` on your class
  #
  # 1. Expose the Enumerable thing with an attr_reader, interact with it directly
  #    attr_reader :cards
  #    deck = Deck.new
  #    deck.cards.each { |c| blah blah blah }
  #
  # 2. Define an each method that talks to the Enumerable thing
  #    deck = Deck.new
  #    deck.each { |c| blah blah blah }
  #
  # When possible, the second is preferred.
  # More "ruby-ish", hides/encapsulates implementation better!

  def initialize
    @cards = []
    Card::RANKS.each do |rank|
      Card::SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def each
    @cards.each { |card| yield card }
  end
end

class KeywordCard
  def initialize(opts={})
    puts "The opts hash contains: #{opts}"
    @rank = opts[:rank]
    @suit = opts[:suit]
  end
end

def print_name(first, last, middle=nil)
  if middle
    puts "#{first} #{middle} #{last}"
  else
    puts "#{first} #{last}"
  end
end

# print_name('britton', 'butler', 'stanhope')
# print_name('britton', 'butler')

class NewerKeywordCard
  def initialize rank: nil, suit: nil
    @rank = rank
    @suit = suit
  end
end

# NewerKeywordCard.new(suit: :hearts, :rank => 8)

# deck = []
# Card::SUITS.each do |s|
#   Card::RANKS.each do |r|
#     deck << Card.new(r, s)
#   end
# end
# deck

binding.pry
