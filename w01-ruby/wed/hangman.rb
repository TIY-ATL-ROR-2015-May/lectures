require 'pry'
require 'set'

word_list = ["cookies", "kittens", "fairies",
             "words", "linux", "lisp", "music",
             "songs","beer", "love", "fun",
             "code", "cease", "and", "desist",
             "read", "print", "eval", "loop",
             "macro", "ruby"]

turn_count = 7
guesses = Set.new

def intermediate_word(answer, guesses)
  #answer.each_char { |l| guesses.include?(l) ? print l : print "-" }
  answer.each_char do |letter|
    #guesses.include?(letter) ? print letter : print "-"
    if guesses.include?(letter)
      print letter
    else
      print "-"
    end
  end
  puts
end

def word_complete?(word, guessed_letters)
  guessed_letters == word.chars.to_set
end

binding.pry
