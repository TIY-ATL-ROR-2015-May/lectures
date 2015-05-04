# For each number from 1 to n:
# If it's divisible by 5 print Fizz.
# If it's divisible by 3 print Buzz.
# If it's divisible by 15, print FizzBuzz.
# Otherwise, print the number.

def fizz_buzz(n)
  1.upto(n) do |i|
    if i % 15 == 0
      puts "FizzBuzz"
    elsif i % 5 == 0
      puts "Fizz"
    elsif i % 3 == 0
      puts "Buzz"
    else
      puts i
    end
  end
end

def fancy_fizzbuzz(n)
  (1..n).each do |i|
    x = ''
    x += 'Fizz' if i % 5 == 0
    x += 'Buzz' if i % 3 == 0
    puts (x.empty? ? i : x)
  end
end

# fizz_buzz(100)
fancy_fizzbuzz(15)
