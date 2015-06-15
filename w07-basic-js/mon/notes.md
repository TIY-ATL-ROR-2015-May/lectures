# 06/15 - Week 7, Monday, Authentication & Devise

All code from today's lecture is in the `Blarg` project on Github.
[This pull request][today-pr] contains today's code from lecture.

[today-pr]: https://github.com/TIY-ATL-ROR-2015-May/blarg/pull/3 

## Quiz Time!
* What is a remote? What is a fork vs a clone?
* What do the session docs mean when they say "HTTP is a stateless protocol"?
* What sorts of things are reasonable to store in a session?
* What do you think it would mean for something to be stateful?

## Devise and Auth Systems!

### Installation

1. Add `gem 'devise'` to Gemfile and `bundle`. Commit!
2. Run `rails g devise:install`. Commit!
   * Optional: Tweak site routes (e.g. to add homepage/root route)
               and config files, initializers, etc.
3. Run `rails g devise User` and `rake db:migrate`. Commit!

### Usage


### Additional Notes

* Though the models and views are in our project,
  the controllers for login etc are inside the gem.
  We do *not* have direct access to the devise controllers.
  Thankfully, we'll see that we don't need access very often.

* It will be slightly unintuitive but any Request or Session related
  methods should be avoided in our Models. Our Models *do not know*
  they are "on the internet". They don't think about the session or
  `params`, etc. MVC is about separating concerns, models don't think
  about the web.

### Questions

1. What if we want to add additional fields to our User model?

   A: Just change the migration before you run it and update the views!
      (Also, add validations on the model if you need to.)

2. If you restart the Rails server, do the sessions still work
   (because the data is in the user's browser)?
