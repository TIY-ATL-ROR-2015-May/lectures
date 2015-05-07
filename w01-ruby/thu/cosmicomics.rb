require 'pry'

def has_joiner?(word1, word2)
  word1[-1] == word2[0]
end

def is_anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

def is_funny_word?(word1, word2)
  is_anagram?(word1, word2) && has_joiner?(word1, word2)
end

def build_dictionary
  result = Hash.new([])
  File.open('english-dict.txt', 'r') do |f|
    f.each_line do |l|
      word = l.chomp
      result[word.length] += [word] if word.length > 3
    end
  end
  result
end

# "Premature optimization is the root of all evil." - Donald Knuth

def cosmicomics
  dict = build_dictionary
  dict.each do |length, words|
    words.combination(2) do |word1, word2|
      puts word1[0, length-1] + word2 if is_funny_word?(word1, word2)
    end
  end
end

cosmicomics
