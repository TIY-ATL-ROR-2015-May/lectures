class Dictionary
  def initialize(file)
    @dict = []
    @used_words = []
    File.open(file, 'r') do |f|
      f.each_line do |line|
        @dict << line.chomp if line.chomp.length > 3
      end
    end
  end

  def random_word
    word = @dict.sample
    while @used_words.include?(word)
      word = @dict.sample
    end
    @used_words << word
    word
  end
end
