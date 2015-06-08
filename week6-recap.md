## Week 1 - Imperative Programming & Scripts

### Key Concepts

  * Data Types: Booleans, Fixnums (Integers), Floats, Strings, Symbols
  * Compound Data Types: Arrays, Hashes, Sets
  * Local Variables & Assignment
    * Definition: `nums = [1, 2, 3, 4]`
    * Use: `puts nums`
    * Assignment replaces the original definition with a new one. It looks identical to defining the variable.
  * Constants
    * Definition: `PI = 3.14159`
    * Use: `PI * (radius ** 2)`
  * Conditionals:
    * Standard: If (condition) / Else
    * Multiple Conditions: If (condition-1) / Elsif (condition-2) / etc, optionally Else (default)
    * One-legged: Unless (condition)
    * Value comparison: [Case](http://ruby-doc.org/docs/keywords/1.9/Object.html#method-i-case)
  * Loops:
    * Numeric loops: times, upto, downto
    * Item loops: each 
    * Conditional loops: while (condition), until (condition)
  * I/O: puts, gets
  * Functions!
    * Definition: `def foo(x) ... end`
    * Use: `foo(42)`
    * Why? To reuse a piece of functionality in multiple places.

### Detailed Review

* Functions Arguments & Scope
  * Functions create a "new scope" meaning that no local variables defined outside the function
    are available inside it. For data to be available in a function, we must pass that data
    to the function as an argument, which makes it visible as if it had been defined in a
    local variable inside the function.

    Constants are in scope inside functions but we use them sparingly. Programs are principally about
    working with data that changes, not data that is *constant*.

* Compound Data Types
  * Compound Data Types can hold data of any kind. We choose which one to use based on how we wish to
    interact with our data. For example, Arrays are used for data that is in a specific order, or if
    it makes sense to refer to items by their *position*. Hashes are used for data that should be referred
    to or accessed by its *name* and are generally not relied on for ordering, though items in Ruby
    hashes are ordered by the order in which items were inserted. Sets are used for data that must
    *not have duplicates* and for which order does not matter.

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

  * Everything in Ruby is an Object. Every Object is an instance of a class.
    * Call `obj.class` on any object to get its class!
    * Object(n):
      * A value of a certain data type (aka Class) guaranteed to understand certain messages (aka methods).
    * Method Dispatch!

  * Classes
    * Definition: `class Board ... (methods) ... end`
    * Use: `foo = Board.new`. Call methods on foo like: `foo.legal_move?(5)` .
    * Why? To separate concerns and break our programs into *components* that only have to understand a subset of the problem.

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
    * Why? To have confidence when making changes to unfamiliar code and to ease maintenace in the long term.

  * `require`: Not only to include other libraries but also for our own files!
  * Regular Expressions: A pattern language for searching in text. See: [Rubular](http://rubular.com)
  * Enumerable! When working with Arrays and Hashes, reach for Enumerable *first*.

  * Blocks, Procs, and Lambda: Too many kinds of Anonymous Functions
  * Fancy argument types
    * Optional args: `def initialize(auth_token=nil)`
    * Keyword args: `class Card ... def initialize(rank: nil, suit: nil) ... (more methods) ... end`
    * Var args: `def product(*nums)`

### Detailed Review

* Classes: Data and Scope
  * **Classes and Modules are ALWAYS accessible.**
    * Though they may need to be referred to via their namespace
      if you're in a different module or at the "top level". E.g. `IronYardGames::Card`.
  * Initializers: Can define a method called `initialize` that defines any initial data about the object.
  * Instance Variables:
    * Definition: `@height = height`
    * Use: `@height`
    * Why? To keep data permanently inside the object and make it in scope to all methods defined on the object.
  * Self: A contextual way to refer to an object.
    * Inside a class method: Refers to the class.
    * Inside a normal (instance) method: Refers to the instance of the class on which the method was called.
  * attr_reader / attr_writer / attr_accessor:
    * For granting access to instance variables inside a class.
    * Each takes a list of symbols to define methods for.
    * Definition: `class Game ... attr_accessor :board ... attr_reader :player1, :player2 ... end`
    * Use: `game.board = Board.new`, `player = game.player1`, etc.

* Method Dispatch!
  * `Foo.ancestors` returns an array of Classes and Modules that `Foo` "Inherits" from.
     (Can be done on an instance of a class with `instance.class.ancestors`.)

   * Example:
     Say we have an object which is an instance of the board class. E.g. `board = Board.new`

     When we make a method call, a message is being sent to that object. E.g. `board.legal_move?(5)`

     The object looks for a matching method definition and calls the first one it finds,

     starting with its defining class and proceeding along the list of ancestors.

* Blocks, Procs, Lambda
  * Blocks, Procs, and Lambdas are all kinds of anonymous functions, that is functions without a name.
  * The interesting thing about this is that we can pass them as *arguments* to other, more general, functions.
  * In some sense, they allow us to treat functions as a piece of data!

  * E.g. There are many many times we'd like to go through a list and retrieve data matching some rule.

    We shouldn't have to hand write a loop for this every time. We should be able to lean on a general technique.

    We achieve this with Enumerable objects by "leaning on" the `select` method and passing it
    a "block" which handles the "specific behavior" the data should adhere to.

    * Example: `[1,2,3,4].select {|x| x.even? }`
      * Equivalent to:

        ```
        [1,2,3,4].select do |x|
          x.even?
        end
        ```

      * The terser style is generally preferred where it does not make the code to hard to read or cram too much onto one line.

      * There is even a shortcut for the common case of simply calling a method on each object: `[1,2,3,4].select(&:even?)`

  * Blocks are pervasive in Ruby code!
  * Curiously though I said blocks were like "functions as a piece of data",
    they cannot be saved as variables and so they don't seem like "real" objects.

    Again, you can't save a block into a variable, you can just pass it to other functions/methods.
  * Procs and Lambdas, on the other hand, *can* be saved as local variables.
    * Example: `square = lambda {|x| x * x }`
    * Usage: `square.call(8)`

  * Procs and Lambdas differ in how minor details of scoping and how they handle statements like `break` and `return`.
  * As a result, code that relies heavily on how Proc and Lambda work is brittle, hard to read, and hard to maintain.
    * Procs and Lambdas are thus not seen terribly often in Ruby code.

  * Yield
    * It turns out all methods implicitly take a block as an argument in Ruby but aren't required to do anything with it.
      * E.g. `puts "hello there!" { |x| x * 2 }` is valid code and will not crash but the block is ignored and doesn't run.
    * So any method that wants to take a block as an argument can:
      * Check if a block has been passed in like so: `block_given?`
      * Run the block (optionally passing it arguments) with yield: `yield(x)`

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
    * Schema(n): The current layout of the database including all tables and their columns.
    * Table(n): A place in the database to store multiple pieces of data sharing a common structure.
    * Migration(n): A change to the Schema effecting one or more tables.
    * ORM(n): An Object Relational Mapper. Or, the fancy thing that talks to the database for us.
              In our case, ActiveRecord.

  * ActiveRecord Basics:
    * Migrations: A class that subclasses `ActiveRecord::Migration` and has up and down methods or a change method.
    * Models: A class that subclasses `ActiveRecord::Base`.
      * Definition: `class User < ActiveRecord::Base`
      * Use (with a specific instance): `user.email = "foo@bar.com"`, `user.save`, `user.games`, etc
      * Use (to query the whole table): `User.where(name: ["brit", "sherri", "rickard"])`

    * Basic Querying: CRUD, etc. Examples for `class User < ActiveRecord::Base`
      * Create: `user = User.create(name: "brit", occupation: "instructor")`
      * Read:   `users = User.where(occupation: "instructor")` or `user = User.find_by(name: "brit")`.
      * Update: `user.update(age: 28)`
      * Delete: `user.destroy`

      * Note that most query operations can be chained!
      * For more querying, including important methods like `limit`, `offset`, `order`, `group`, `count`, etc
        refer to the [ActiveRecord guide][querying].

    * Associations: 1-to-1, 1-to-many, Many-to-many
      * Allows us to define a connection between tables.
      * Any associations we define rely on aspects of the database schema, specifically the location of Foreign Keys!
      * `belongs_to :player`
      * `has_many :games`
      * `has_many :tags, through: :post_tags`

    * Joins: A type of query involving data from more than one table.

[querying]: guides.rubyonrails.org/active_record_querying.html

### Ancillary Concepts

  * Gems (aka Libraries)
    * A way for us to reuse substantial functionality/code already written by others!
  * Bundler
    * A tool to manage the specific gem versions needed from project to project and keep them out of conflict.

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

  * All requests *and* responses have both headers and a body.
    * We're usually mostly interested in headers of the response. Headers in a request mostly used for Authentication.
  * Headers
    * Status Code
    * Hostname
    * All kinds of interesting metadata! Up to the server what else is in there.
  * Body
    * The main content of a request or response.
    * GET *requests* don't usually have a body. POST *requests* do. All responses other than for deletion normally have a body.

  * DNS / Domain Names - A way to map IP addresses to human readable names. E.g. `google.com`
  * IP Addresses and Ports - A unique identifier for a communication channel to a specific computer. `10.0.0.45:4567``

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

### Detailed Review

* HTTParty - Used to make HTTP requests with Ruby.
  * Generally included in a class for the API you want to talk to.
    * Example: `class Github ... include HTTParty ... (methods) ... end`

    * Adds several class methods that can be used to send a request: `get`, `post`, `put`, `delete`, etc.
    * Example: `def get_user(username) ... self.class.get("/users/#{username}") ... end`

    * Can also specify the `base_uri` for the class so you don't have to type "api.foo.com" all the time.
    * All requests methods (get, post, put, delete, etc) take several optional parameters passed as key value pairs:
      * `headers:` which may specify a hash of request headers.
      * `body:` which may specify a hash of params to be sent in the body of the request, aka postdata.
      * `query:` which may specify a hash of params to use as a querystring.

* OAuth - What is it for? How does it work?
  * Intended to replace the need for users to give their username and password to other sites for e.g. Facebook apps.
  * Better in two ways:
    1. Don't have to give out your username and password (which probably is used for more than one account).
    2. Access can be granted in a more granular fashion so "apps" only have certain permissions.
  * Complications?
    * Mostly in figuring out which of many potential OAuth "flows" is appropriate.
  * End goal: Get an "access token" that can be refreshed if it expires, store it permanently.
    * Make sure to specify any specific 'Scopes' (aka access rights) your program needs to the user's account.

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
  * Exceptions / Begin / Rescue

### Projects

  * Mon: Jukeberx (really just an app for random statuses)
  * Tue: Jukeberx (Searcher class, Song class, MP3 Tags, basic API)
  * Wed: Jukeberx (Branches, Views, Get songs playing!)
  * Thu: JD's Guest Lecture, Codepen things, Demonstrate partials in Jukebox in review

### Weekend Assignment

  * Etsiest!
