# Homework Review

* Who would like to present their Number Guessing Game solution?

* Who has a destutter solution?

---

# String Interpolation 

* Only works with double-quoted strings, not single-quoted ones.

* Instead of `puts "foo is: " + foo` you can write `puts "Foo is: #{foo}"`.

* In fact, you can evaluate any arbitrary expression.

  E.g. `puts "Foo is: #{2 + 2}"`, etc.

---

# Hash Tables or "Hashes" for short

* Sometimes called Dictionaries or Maps in other languages

--

* The whole point is to let you look things up by name.
  This is in contrast to arrays where you only get things by
  1. Iterating over the whole array.
  2. Accessing a specific element by its *index*.

--

* Often the choice of whether an Array or Hash is more appropriate
  comes down to how you'd usually prefer to store and retrieve the data.

---

# Hash Tables, cont.

* An example:
  `{ brit: 'likes dogs',
     tim: 'likes whiskey',
     jd: 'likes bumper pool',
     jo: 'likes ping pong' }`

--

* We say that the names on the left are **Keys** and the things on the right are **Values**.

--

* When a Key and Value are grouped together, we call that a Key-Value Pair.
  They pop up all over. Can be written two ways:
  1. `foo: 'bar'`
  2. `:foo => 'bar'`

--

* I've been using symbols for keys and strings for values but you can use any
  Ruby object for the Keys *or* the Values!

* String or Symbol keys are the most common though.

---

# A Larger Example

## Build our own "Hash" from scratch, Or ...

* We could implement the following functions:
  1. create_hash
  2. add_kv_pair(hash, k, v)
  3. del_kv_pair(hash, k, v)
  4. hash_keys(hash)
  5. hash_vals(hash)

## Write a Function to Print an ASCII Table

* We could start with a basic 2-column table.
* Then we could try and make it work for any number of columns. :)

---

# Git & Github

## Git

* What is a repository?
* What is a commit?
* How do we create a repo, track file(s), change file(s), check status, view log, push?

## Github

* Makes it easier to collaborate. Social networks for nerds woo.
* Also allows us to track bugs with "Issues".
  Will be assigning issues for all homework going forward.
* Github repos are "remotes" or copies of our local repos. We need to keep them in sync.
* Github gets much more interesting once we start doing group work. 

---

# Homework

### [Happy Hacking!][homework]

.center[![hack_the_planet](https://33.media.tumblr.com/bd426ed8849ca171c70093023181f0ab/tumblr_mxnnox9Ro91qzh636o1_500.gif)]

[homework]: https://github.com/TIY-ATL-ROR-2015-May/lectures/blob/master/w01-ruby/tue/questions.md
