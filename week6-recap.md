## Week 1 - Imperative Programming & Scripts

### Key Concepts

  * Data Types: Booleans, Fixnums (Integers), Floats, Strings, Symbols
  * Compound Data Types: Arrays, Hashes, Sets
  * Local Variables & Assignment
  * Conditionals:
    * Standard: If / Else
    * Multiple Conditions: If condition-1 / Elsif condition-2 / etc, optionally Else (default)
    * Value comparison: Case
    * One-legged: Unless
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

---

## Week 2 - Object Oriented Programming

### Key Concepts

  * Everything is an Object. Every Object is an instance of a class.
    * Call `obj.class` on any object to get its class!
    * Object(n): A value of a certain data type (aka Class)
                 guaranteed to understand certain messages (aka methods).
    * Method Dispatch & Ancestors
      * `Foo.ancestors` returns an array of Classes and Modules that `Foo` "Inherits" from.
        (Can be done on an instance of a class with `instance.class.ancestors`.)

      * Example:
        Say we have an object which is an instance of the board class. E.g. `board = Board.new`
        When we make a method call, a message is being sent to that object. E.g. `board.legal_move?(5)`
        The object looks for a matching method definition and calls the first one it finds,
        starting with its defining class and proceeding up the list of ancestors.
  * Classes
    * Definition: `class Board ... (methods) ... end`
    * Use: `foo = Board.new`. Call methods on foo like: `foo.legal_move?(5)` .
  * Modules: A mechanism for Namespacing and Mixins.
    * Namespacing:
      * A way to isolate the names we use for classes so as not to conflict with other libraries.
        * Example: `octokit` gem for interacting with Github API might define their own User class
                   to return data associated with a github User. To avoid conflict with other User
                   classes, they'll put it in the octocat module, e.g. `Octokit::User`.
      * Definition: `module Foo ... (classes) ... end`
      * Use: `toy = Foo::Bar.new`. Call methods on toy!
    * Mixins:
      * A way to share common methods among *unrelated* classes that satisfy the Mixin requirements.
        * Example: Comparable module (that grants `<`, `>`, `==`, etc) requires implementing `<=>` method.
        * Example: Enumerable module (that grants `map`, `select`, `find`, etc) requires implementing `each` method.
      * Definition: `module Foo ... (methods) ... end`
      * Use: `class Bar ... include Foo ... (methods) ... end`
        Later: `toy = Bar.new`.
        Call methods on toy from Bar or Bar's ancestors or Foo!

### Ancillary Concepts

  * Testing
    * Unit Testing: A test for a small part of your program, generally just a single method in a class.
    * TDD: Writing tests for a feature or bug *first* before any other code. 
  * `require`: Not only to include other libraries but also for our own files!
  * Regular Expressions: A pattern language for searching in text. `/^[0-9]+$/ =~ gets.chomp`
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

---

## Week 3 - SQL Databases 

### Key Concepts

  * Database Basics:
    * Schema(n):
    * Table(n): 
    * Migration(n):
    * ORM(n): An Object Relational Mapper. Or, the fancy thing that talks to the database for us.
              In our case, ActiveRecord.
  * ActiveRecord Basics:
    * Models
    * Querying: CRUD, etc
      * Create:
      * Read:
      * Update:
      * Delete: 
    * Associations: 1-to-1, 1-to-many, Many-to-many, Joins et al
      * `belongs_to`
      * `has_many`
      * `has_many through`

### Ancillary Concepts

  * Bundler, Gems/Libraries

### Projects

  * Monday: Guessr
  * Tuesday: Guessr w/ Associations!
  * Wednesday: Blergers
  * Thursday: Blergers HW + Hard Mode!

### Weekend Assignment

  * TooDead!

---

## Week 4 - APIs and the Web

### Key Concepts

  * The web is just a series of Requests and Responses.
    * Request(n): An HTTP verb + a domain + a path + any needed parameters.
    * Response(n): At least headers w/ status code. Usually some JSON data.
    * Web API(n): A collection of documented routes that the server responds to with data,
                  allowing a program to use a web service without human assistance.
    * API(n): A contract to answer certain documented messages in a particular way,
              could be for a plain old class, could be for a library or a server.
  * Headers
    * Status Code
    * Hostname
    * All kinds of interesting metadata!
  * DNS / Domain Names
  * IP Addresses and Ports - "10.0.0.45:4567" which part is IP, which part is port?
  * The (main) HTTP Verbs!
    * `GET` - Used to retrieve a resource.        Like Reading from CRUD.
    * `PUT \ PATCH` - Used to change a resource.  Like Update from CRUD.
    * `POST` - Used to make a new resource.       Like Create from CRUD.
    * `DELETE` - Used to delete a resource.       Like Delete from CRUD.
  * The (main) Status Codes:
    * 200 - OK.
    * 401 - Unauthorized.
    * 403 - Unauthenticated.
    * 404 - Lulz, couldn't find that.
  * The Status Code hierarchy:
    * 1xx - Informational.
    * 2xx - Success.
    * 3xx - Redirect.
    * 4xx - Client messed up.
    * 5xx - Server messed up.
  * JSON - JavaScript Object Notation. Just a serialization format for shipping data around universally.

### Projects

  * Tuesday: Curl Experiments!
  * Wednesday: Issues (Github HTTParty things)
  * Thursday: Scrapr (Github API -> Database)
  * Friday: OAuth discussion

### Weekend Assignment

  * CommitChamp!

---

## Week 5 - Routing and Controllers, Views and Templates

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
