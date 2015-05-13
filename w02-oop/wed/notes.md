# First Things First

* I'm proud of y'all. I know this stuff is hard.

* Our pace is pretty crazy around here.

* Continue to trust that this will all sink in with time.

---

# Today's Topics

1. Blocks, Procs, and Lambdas, Oh My!

  * Also `yield`.

--

2. Modules: Namespacing and Mixins

  * Also, why no Multiple Inheritance?

--

3. Arguments Redux

   * Optional Args
   * Var Args
   * Key Args

---

# Blocks, Procs, and Lambdas, Oh My!

Really one important thing to know:

* Writing code that depends on the intricate differences
  between these things is a bad idea. Too clever!

--

Other things:

* Mostly just want y'all to know these things exist.

* Blocks are the simplest variant.

* Remember, how I said a block is like a function without a name?
  And that it lets us have "functions as data"?
  I.e. Pass a function as an argument to another function. (E.g. A block to `.each`.)

* Well, that's all true. But, weirdly, you can't save a block in a variable.

* But you can with a lambda. T_T

* I don't even remember what the hell a proc is.

---

# And one more thing ...

* All methods implicitly take a block!

* Weird, right? If the method doesn't explicitly reference it, ruby ignores it.

--

* `puts [1,2,3,4] {|x| x * 2}` is not invalid code. But the block gets ignored.

* To explicitly run a block, you use `yield`.

---

# Small examples:

```
def twice
  yield
  yield
end
```

--

* But that's boring so ...

--

* At some point I said you could actually implement map with each?

--

* Yeah, you can.

```
def my_map(enum)
  result = enum.class.new
  enum.each do |x|
    # Adding an answer with << doesn't work with Hashes. :-/
    # Not sure how they actually do this. Maybe there's a way
    # to cast result to enum.class?
    result << yield(x)
  end
  result
end
```

---

# Modules

The cliffnotes are as follows:

--

* They *cannot* be instantiated! I.e. `MyModule.new` is not a thing.

--

* Containers for classes and/or methods.

--

* Two primary ways in which they are used:
  * To share behavior between multiple **unrelated** classes, such as Enumerable or Kernel.
  * To **Namespace** code.

---

# Namespacing

* Did he same namespacing? WTF is namespacing?

--

* It's about being able to share code. We don't want names to clash.

* You don't want your "User" class to override the one defined by e.g. the Twitter gem.

--

* Normally represented with double colons. I.e. `MiniTest::Test` is a `Test` class in the `MiniTest` module.

---

# Mixins

* A way of adding methods/behavior to a class *without* an "Inheritance Hierarchy".

* Enumerable is a great example.

* But let's see another one ...

---

# Args, Args, Args

## Oh, Fuck it. Let's look at some code, yeah?

---

# Homework

* Forthcoming. My afternoon schedule is rough today though:
  * Staff meeting from 12:30 - 1:30.
  * Student Interviews at: 3:30, 4:00, 4:30
