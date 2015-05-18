require 'pry'

#* basic data types: strings, symbols, numbers
#* collections: arrays
#* conditionals: if else end
#* loops: times

#* Blocks

## FizzBuzz
#* For the numbers from 1 to 100:
#* If the number is divisible by 3, print Fizz
#* If the number is divisible by 5, print Buzz
#* If the number is divisible by both, print FizzBuzz
#* If the number is anything else, print the number

def fizz_buzz(n)
  1.upto(n) do |x|
    if x % 3 == 0 && x % 5 == 0
      puts "FizzBuzz"
    elsif x % 3 == 0
      puts "Fizz"
    elsif x % 5 == 0
      puts "Buzz"
    else
      puts x
    end
  end
end

# 1.upto(100) do |i|
#   answer = ""
#   answer += "Fizz" if i % 3 == 0
#   answer += "Buzz" if i % 5 == 0
#   puts (answer == "" ? i : answer)
# end

binding.pry
