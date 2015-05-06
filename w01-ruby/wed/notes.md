# Morning Y'all

![morning](http://i.imgur.com/LBm5fQw.jpg)

---

# Announcements

First, let it be said y'all are doing great so far.
I know we've covered a lot real fast and you don't have it all down yet.
That's cool!

1. I added an "External Resources" notebook to our course section on
   `theironyard.teamwork.com`.

   So far it just contains some cheatsheets for various text editors but
   if you find a really helpful guide, tutorial, or even just an interesting
   ruby library, let's catalog it! :)

2. I've opened up "Student 1-on-1s" in my Calendly. Any of you are free to book
   me for 15 minutes and ask whatever you like. Just 2 things:
   1. Please only book one appointment a week. I have limited time and everyone
      deserves a chance to see me and check in.
   2. Please don't book me *this* week. <3

---

# Today's Topics

1. Functions, Argument Passing, and Scope
2. Better Testing and Debugging with Pry
3. Let's write a script to play Hangman!
4. Git and Github / Homework Submission

---

# Homework Review

* Capped at 15 minutes to keep room for all the other stuff.
* Anyone have a question or want to talk through their solution / get feedback?

---

# Functions and Argument Passing

Function definition:

```
def test(stuff)
  stuff.do_things
end

def foo(x)
  result = x.bar.baz
  test(result)
end
```

Function call:

```
my_variable = 52
foo(my_variable)
```

---

# Better Testing and Debugging with Pry

1. `gem install pry` on the command line. Cool. Now you have pry.

--

2. You can use it by running pry on the command line instead of irb.

--

3. Other than having tab-completion, syntax highlighting, and awesome commands
   like `ls`, `whereami` and `wtf`, we'll see next week it allows searching
   for methods, reading docs, and more.

--

4. But most importantly, you can put `require 'pry'` at the top of your ruby file
   and `binding.pry` in the place you want to debug or see what's happening and
   when your program reaches that point in execution, a shell will automatically open!
   No more annoying copying and pasting into IRB!

---

# Let's Write Hangman!

* One of the first substantive scripts I wrote was a terminal version of Hangman back in 2008.
* Let's look at my old code and then write a better version!
* It's written in a language called "Common Lisp". Stay calm. :D

--

There are three big takeaways to look for:

--

1. Even though we don't understand the language, we can pick up the high level structure.
   Things like function calling, parameter passing, arrays are not so different!

--

2. A better design is generally better in *any* language.

--

3. If we can enforce a rule by what data structures we use, that is almost always a good choice.

---

# Git and Github

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

# New Homework Submission

* I'll open an "Issue" on github for each of you that links to the
  homework description and assign the issue to you.

* When you're done, push your code to github, leave a link to it in the issue
  and close it.

---

# Tonight's Homework

### [Happy Hacking!][homework]

.center[![computer_doge](http://40.media.tumblr.com/tumblr_m12hieqxHq1rrgr1no1_500.jpg)]

[homework]: https://github.com/TIY-ATL-ROR-2015-May/lectures/blob/master/w01-ruby/wed/questions.md
