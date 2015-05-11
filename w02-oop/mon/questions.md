Tic-Tac-Toe Redux 

**Required:**
If you finished your Tic-Tac-Toe, clean it up and refactor it as
 much as possible using methods from the Enumerable module and regexes.

If you submitted your Tic-Tac-Toe but Easy mode isn't completed
 or it isn't working/finished, finish it!

**BONUS**:
The methods in Enumerable can be built on top of each.
I.e. `map` is the following pattern:
```
def my_map(array)
  result = []
  array.each do |el|
    result << yield(el)
  end
  result
end
```

Pick 3 Enumerable methods, assume they only work on Arrays,
and write them in terms of `.each`. Try not to look up what `yield` is.
Non-working code/pseudocode is acceptable, just think about the patterns.

We'll see more about how to write such methods (and how to make them
work for multiple data types) later this week.
