1. Write your own NATO alphabet.
   There should be a function to
   encode a string and decode a string.
   The encode function will take a string,
   replace all upper and lower
   case characters with their "NATO"
   equivalents and return the result.
   The decode function will take a string,
   replace the "NATO" characters
   with their normal letter form
   and return that.

   Non-alphabetical should be copied/stay
   the same in both cases.

   * Hint 1: Use a Hash Table!

   Example/Test Case:
   * `encode(my_alpha, "dog")` => `"delta omega gamma"`
   * `decode(my_alpha, "delta omega gamma")` => `"dog"`
   * `encode(my_alpha, "i am 24 years old")` =>
     `"india alpha mike 24 yankee echo alpha romeo sierra oscar lima delta"`

2. Pull up the Ruby Docs for the Hash class and read a few methods.
   Pick the one you were most interested in and try to explain what
   it does as clearly as possible.

3. **Hard** Mode: Copy and improve today's ASCII table example.
   Add a new function called "print_header" that takes the max
   key and value lengths as arguments.

   It should print something like the following:

   `+---------+-------+
    |   Key   | Value |
    +---------+-------+`

   You should replace the first call to print_dashes with a call to print_header.

## BONUS!

Look at the wikipedia page for [ROT-13][rot13].
Try to write an encoder and decoder for
ROT-13.

[rot13]: http://en.wikipedia.org/wiki/ROT13
