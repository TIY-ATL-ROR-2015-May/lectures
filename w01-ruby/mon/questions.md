1. If you haven't yet done so, sign up for Github and send me an email with your github username.
   (brit@theironyard.com)

2. Read the manual page for a unix command with man or woman.
   What command did you read about? What does it do?

  For the following two exercises, you should create a directory
  to store your ruby code. Maybe call it "labs". Create a single
  file (e.g. "guess.rb") for each of the following problems:

3. Write a ruby script to play the number guessing game.

  ## Number Guessing Game

  * The game should pick a random number between 1 and 100 when it starts.

  * Each turn the player is asked for a guess.
    * If they don't guess correctly, tell them if they guessed too low or too high.
    * If they guess the number, congratulate the user and exit.

  Hint 1: Use .to_i to convert user input to a number. What is it by default?

  Hint 2: Use rand(number) to get a random number between 0 and number.

4. **Hard Mode**: Write a ruby function to "destutter" an array.

  ## Destutter Function

  Assume you have a Array with duplicate repeated items, such as:
  `[1, 2, 3, 3, 4, 4, 3, 2, 1, 1]`

  The destutter function should remove all *sequential* duplicates,
  returning the new Array: `[1, 2, 3, 4, 3, 2, 1]`.

  For example, if you used the name `destutter` and it takes a single parameter,
  you could test it in irb like so: `destutter([1, 2, 2, 3, 2, -1])`

  What might you need to change to remove *any* duplicates at all,
  not just ones next to each other.
  (e.g. For the same array it would return: `[1, 2, 3, 4]`)
