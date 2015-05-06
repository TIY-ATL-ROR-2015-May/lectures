## Print a Table for a Hash

## toy = {brit: :dogs, tim: :whiskey, jo: :ping_pong}
## example: print_hash(toy)
## prints the following:

## +------------------+
## | key  | value     |
## |------+-----------|
## | brit | dogs      |
## | tim  | whiskey   |
## | jo   | ping pong |
## | juan | many note |
## +------+-----------+

## scratchpad:
## toy = { brit: :dogs, juan: :question, albatross: 'huh' }
## toy.keys => [:brit, :juan, :albatross]
## toy.keys.max => :juan

## How to get the longest key?!?
## Option 1:
## max = 0
## toy.keys.each do |key|
##   max = key.length if key.length > max
## end
## max

## Option 2:
## The max method only works on arrays like: [3, 4, 5, 2, 2]
## result = []
## toy.keys.each do |key|
##   result << key.length
## end
## result

## Exactly the same as: result = toy.keys.map { |key| key.length }
## result.max

## Option 3:
## Use map instead of manually building a result with each.
## toy.keys.map { |key| key.length }.max

## Take an array of strings or symbols, find the longest one.
def max_length(names)
  names.map { |name| name.length }.max
end

def print_dashes(max_k, max_v)
  # 2 spaces for key and value, 3 spaces for pipes
  total = max_k + max_v + 7
  puts "-" * total
end

def print_line(key, value, max_k, max_v)
  puts "| #{key.center(max_k)} | #{value.center(max_v)} |"
end

## What is a Block? What is it for?
## Sometimes we want a function that doesn't have a name.
## Sometimes we want to pass as an argument, as data.

# foo = [1, 2, 3, 4, 5]
# result = foo.map { |x| x * 20 }

## Alternately ...
#result = []
#def multiplier(x)
#  x * 20
#end

#for i in foo do
#  result << multiplier(i)
#end

def print_kv_pairs(hash, max_k, max_v)
  puts key # out of scope
  hash.each do |key, value|
    print_line(key.to_s, value.to_s, max_k, max_v)
    puts key # in scope!
  end
  puts key # out of scope
end

def print_hash(hash)
  longest_key = max_length(hash.keys)
  longest_val = max_length(hash.values)

  print_dashes(longest_key, longest_val)
  print_kv_pairs(hash, longest_key, longest_val)
  print_dashes(longest_key, longest_val)
end

# toy = {brit: :hungry, jo: :ping_pong, tim: :whiskey}
# print_hash(toy)
