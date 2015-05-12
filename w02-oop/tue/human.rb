class Human
  def guess
    puts "Please guess a letter:"
    letter = gets.chomp.downcase
    until letter =~ /^[a-z]$/
      puts "Nope. Pick a *letter*:"
      letter = gets.chomp.downcase
    end
    letter
  end
end
