class Dictionary
  def initialize(file)
    @words = []
    @used_words = []
    File.open(file, 'r') do |f|
      f.each_line do |line|
        @words << line.chomp if line.chomp.length > 3
      end
    end
  end

  def random_word
    word = @words.sample
    while @used_words.include?(word)
      word = @words.sample
    end
    @used_words << word
    word
  end
end
