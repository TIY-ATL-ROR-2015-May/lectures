## Week 1 - Imperative Programming & Scripts

### Key Concepts

  * Data Types: Booleans, Fixnums (Integers), Floats, Strings, Symbols
  * Compound Data Types: Arrays, Hashes, Sets
  * Local Variables & Assignment
  * Conditionals: If, Elsif, Else, When/Unless
  * Loops:
    * Numeric loops: times, upto, downto
    * Item loops: each
    * Conditional loops: while, until
  * I/O: puts, gets
  * Functions!
    * Definition: `def foo(x) ... end`
    * Use: `foo(42)`

### Projects

  * Monday: FizzBuzz
  * Tuesday: AsciiTable
  * Wednesday: Hangman
  * Thursday: Cosmicomics

### Weekend Project

  * Tic Tac Toe!

## Week 2 - Object Oriented Programming & Testing

### Key Concepts

  * Everything is an Object. Every Object is an instance of a class.
    * Object(n): A value of a certain data type (aka Class)
                 guaranteed to understand certain messages (aka methods).
    * Method Dispatch & Ancestors
      * blah blah blah
  * Classes
    * Definition: `class Board ... (methods) ... end`
    * Use: `foo = Board.new`. Call methods on foo.
  * Modules: A mechanism for Namespacing and Mixins
    * Namespacing:
    * Mixins:
      * Definition: `module Foo ... (methods) ... end`
      * Use: `class Bar ... include Foo ... (methods) ... end`
        Later: `toy = Bar.new`. Call methods on toy from Bar or Bar's ancestors or Foo!

### Ancillary Concepts

  * Testing
    * Unit Testing: A test for a small part of your program, generally just a single method in a class.
    * TDD: Writing tests for a feature or bug *first* before any other code. 
  * Regular Expressions: A pattern language for searching in text.
  * Enumerable! When working with Arrays and Hashes, reach for Enumerable *first*.
  * Blocks, Procs, and Lambda: Too many kinds of Anonymous Functions
    * Yield
  * Fancy argument types
    * Optional args: `def initialize(auth_token=nil)`
    * Keyword args: `class Card ... def initialize(rank: nil, suit: nil) ... (more methods) ... end`
    * Var args: `def product(*nums)`

### Projects

  * Monday: Tic-Tac-Toe Review!
  * Tuesday: Hangman OO-ified
  * Wednesday: IronYardGames (Card/Deck)
  * Thursday: Testing, OO Design (moar Card class)

### Weekend Assignment

  * OO Tic Tac Toe!

## Week 3 - Databases & Active Record

### Key Concepts

  * Schema, Tables, Migrations
  * Models
  * Basic Querying: Create, Read, Update, Delete
  * Joins and Associations
  * Remember, Database lives *outside* Ruby!

### Ancillary Concepts

  * Bundler, Gems

### Projects

  * Monday: Guessr
  * Tuesday: Guessr w/ Associations!
  * Wednesday: Blergers
  * Thursday: Blergers HW + Hard Mode!

### Weekend Assignment

  * TooDead!

## Week 4 - APIs, The Web & HTTParty

### Key Concepts

### Projects

  * Tuesday: Curl Experiments!
  * Wednesday: Issues (Github HTTParty things)
  * Thursday: Scrapr (Github API -> Database)
  * Friday: OAuth discussion

### Weekend Assignment

  * CommitChamp!

## Week 5 - Routing and Controllers w/ Sinatra, Views and Templates w/ ERB

### Key Concepts

  * Controller/Route
  * Views
  * Template Language
  * HTML/CSS

### Projects

  * Mon: Jukeberx (really just an app for random statuses)
  * Tue: Jukeberx (Searcher class, Song class, MP3 Tags, basic API)
  * Wed: Jukeberx (Branches, Views, Get songs playing!)
  * Thu: JD's Guest Lecture, Codepen things, Demonstrate partials in Jukebox in review

### Weekend Assignment

  * Etsiest!
