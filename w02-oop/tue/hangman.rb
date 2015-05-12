require 'pry'
require 'set'

require './dictionary'
require './computer'
require './human'

class Hangman
  def initialize(player)
    dict = Dictionary.new("/Users/brit/english-dict.txt")
    @answer = dict.random_word
    @turn_count = 7 # A reasonable number of turns.
    @player = player
    @guesses = Set.new
  end

  def finished?
    @turn_count.zero? || @answer.chars.to_set.subset?(@guesses)
  end

  def play
    until self.finished?
      self.turn
    end
    puts "Thanks for playing!"
  end

  def get_guess
    guess = @player.guess
    while @guesses.include?(guess)
      puts "You already guessed #{guess}, dummy!"
      guess = @player.guess
    end
    @guesses.add(guess)
    guess
  end

  def turn
    guess = self.get_guess
    @turn_count -= 1 unless @answer.include?(guess)
  end
end

binding.pry
