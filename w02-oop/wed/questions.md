## Card Decks

In this assignment, you'll start with
the `cards.rb` code we wrote in class.

The Card class as presently defined allows
for creation and comparison of card objects.

Your homework is to add a Deck class in
the IronYardGames module. Here are some
requirements for the Deck class:

**Easy Mode:**

* Creating a deck with `Deck.new` should
  return a deck object containing the 52
  cards found in a standard card deck.
  (i.e. 2s through Aces in all 4 suits)

* There should be a `draw(n)` method that
  takes a number of cards to draw, removes
  those cards from the Deck and returns
  them as an array.

* There should be a `peek` method to look
  at the top card of the deck without
  removing it (as done when you `draw`).

* There should be a `shuffle` method.
  The result of the 2nd peek call should
  be different than the first in the below
  example:

  ```
  deck.peek
  deck.shuffle
  deck.peek
  ```

**Normal Mode:**
* Decks should implement the Enumerable
  interface. This means you will need to
  implement the `each` method on your Deck
  as specified in the Enumerable docs.


**HARD MODE**:

Write a Hand class which can be built by
supplying a list of card strings such as:
`5H 5C 6S 7S KD`

The first character is rank, the second
is suit. This would return a hand object
containing 5 cards objects.

Write a hand ranking function to compare
two hands and choose the better one.

**Nightmare Mode:**

Use the above Hand evaluator to
successfully solve Project Euler #54.
(https://projecteuler.net/problem=54)
