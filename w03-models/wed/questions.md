For tonight's assignment, you'll update the Blergers project from class.

This will differ from past assignments in that rather than adding more
code to your labs repo, you'll "fork" the blergers repo from the course
organization page, and then "clone" your fork to get a local copy of
the repo to edit.

Post the link to your fork and the output of:
  `Post.page(1)` and `Tag.top_tags` in your assigned github issue before closing it.

To run the code just use `ruby lib/blergers.rb` from the root of your repository.

## Normal Mode

I would again strongly encourage referring to the ActiveRecord guides
(or just starting by reading them to reinforce how to query for data).

The [ActiveRecord Querying][querying] guide is quite helpful, in particular
Chapters: **3, 4, 5, 6, 7, and 19**. The [ActiveRecord Associations][associations] guide
has a reference on methods added by *has_many* which is particularly useful.

Write two Class Methods to perform the following queries:

**NOTE**: Class methods are defined by putting `self.` before the method name.
          I.e. `def self.page(n)`

          Remember that class methods are methods we call on the Class,
          instance methods are methods we call on an object of that class.

1. `Post.page(n)` to return a page of blog results in reverse chronological order.
   I suggest pages of size 10.
   I.e. `Post.page(1)` should return the last 10 posts I wrote,
        `Post.page(2)` should return the next 10 posts after that.

2. `Tag.top_tags` to print a ranking of the tags from most commonly
   used to least commonly used, similar to last night's "scoreboard".

## Hard Mode

1. `Post.count_tagged_by(tags)` should take an array of string tags
   and return the total count of posts with any of those tags.

## Bonus

* Make the page size in Post.page an optional parameter.

* Add a `Post.top_words` method that prints the top 20 most common words
  used in my blog titles.

[querying]: http://guides.rubyonrails.org/active_record_querying.html
[associations]: http://guides.rubyonrails.org/association_basics.html#has-many-association-reference
