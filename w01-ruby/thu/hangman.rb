require 'pry'
require 'set'

word_list = ["cookies", "kittens", "fairies",
             "words", "linux", "lisp", "music",
             "songs","beer", "love", "fun",
             "code", "cease", "and", "desist",
             "read", "print", "eval", "loop",
             "macro", "ruby"]

def intermediate_word(answer, guesses)
  print "The current word is: "
  answer.each_char do |letter|
    if guesses.include?(letter)
      print letter
    else
      print "-"
    end
  end
  puts
end

def word_complete?(word, guessed_letters)
  word.chars.to_set.subset?(guessed_letters)
end

def game_finished?(guesses, answer, turn_count)
  turn_count.zero? || word_complete?(answer, guesses)
end

def valid_guess?(guesses, guess)
  is_letter = ('a' .. 'z').include?(guess.downcase)
  new_guess = !guesses.include?(guess.downcase)
  is_letter && new_guess
end

def get_guess(guesses)
  puts "Please guess a letter:"
  guess = gets.chomp
  until valid_guess?(guesses, guess)
    puts "Previous guesses: #{guesses.to_a}"
    puts "Please enter a letter you haven't guessed: "
    guess = gets.chomp
  end
  guess
end

def hangman(word)
  turn_count = 7
  guesses = Set.new
  until game_finished?(guesses, word, turn_count)
    intermediate_word(word, guesses)
    guess = get_guess(guesses)
    guesses.add(guess)
    turn_count -= 1 unless word.include?(guess)
  end
  puts "Thanks for playing!"
end

hangman(word_list.sample)
