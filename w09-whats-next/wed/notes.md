## A Few Final Project Words

--

* Have your groups figured out and submitted to us by the holiday weekend.

--

* Good news about that: Friday is a half day. Feel free to leave after huddle.

--

* No HW after TodoMVC, but guest lectures next Mon-Wed. Andy Lindeman on Mon!

--

* Monday I want to meet with each Final Project group and help them think through
  data model. That'll basically be my whole afternoon. :)

--

* In general, if you're stumped on something for more than 25 minutes, you should
  ask Vedika or I. If you're stumped on the same thing again in 10 minutes, come
  ask us again.

---

## Here We Go Again ...

* Callin all these damn audibles.

--

* Week 9 [be like](http://i.imgur.com/88Kcv5z.jpg)

---

## Today's Important Topics

1. Some Last Rails-isms.
   * `form_for` is cleaner. (Refactor so we don't need `@action` and `@verb`.)
   * [Strong Params](http://edgeguides.rubyonrails.org/action_controller_overview.html#strong-parameters)

--

2. Javascript Things
   * We'll see how to turn our blarg project into a so-called "Single Page App" with Rails UJS!
   * This is quite similar in most respects to your TodoMVC project. Take a working Rails app, JS-ify it.

--

3. Background Job Things / Mailers
   * We'll send emails without background jobs first and then
     move them to a background job.
   * When we move them to background jobs, we'll work from
     scratch on a new branch in the *clearest* way possible.
   * Tomorrow we'll do more work on the background jobs in Planeswalker.

---

## Rails-isms

* `form_for` solves exactly the problem we had where we used
  `@action` and `@verb` in our controllers so that we could
  have a form partial shared between the New and Edit routes, etc.

  Way better **if and only if** we're actually doing RESTful (resources-ful) stuff.
  Slightly magical, expects to get the "objects" that represent the form we want.
  Figures out the routing and submission method from there.

--

* Strong Parameters is a new type of security in Rails 4.0 keeping
  users from supplying data in a malicous request that we didn't ask for.

  I.e. Turns out when creating a model you can just pass it a hash
       if the column names match up, right?
       What if we did that with our edit user page in Planeswalker? Instant admins?

       Note: This problem actually happened to [Github][github-sec]. Serious stuff.
             (And probably part of why I shake my head when ppl ask me about security.)

[github-sec]: https://github.com/blog/1068-public-key-security-vulnerability-and-mitigation

---

## Javascriptin'

* Q: What does "Single Page App" mean?
  * A: That after the first page/homepage is loaded,
       all links/forms/button on the site just update the 
       current page with javascript, not get a new page.

--

* Q: Okay, so how do we AJAX-ify a link/form/button/etc?
  * A: It's super straightforward. 3 steps:
       1. Add `remote: true` as an option to the link/form/button.
       2. Add `respond_to do |format| ... format.html {} ... format.js {}`
          in the controller that handles that request.
       3. Write an "action.js.erb" template for that controller
          which returns JS to update the web page.

       (This requires some willingness to explore the jQuery API docs.
        It may also prove useful to futz around with binding.pry in the view.)

Now, let's get going!

---

## Enter Email

So it turns out Email sucks. Shocking, right?

### Good News!

Old protocol called [SMTP][smtp] allows us to send mail without running our own mailservers.

I.e. we could Gmail to send emails on our behalf. ... But that means using our personal accounts. :-/

[smtp]: https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol

--

### Better Idea ...

We'll sign up for a service for sending email, [Mandrill][mandrill]!

They have a [free Heroku add-on][heroku-mandrill] (`heroku addons:add mandrill:starter` does the trick) and you get 12,000 messages a month at no charge.

Could also sign up on Mandrill's site and add the API key to your `.env` and `heroku config`.
Done (got username and api key, will travel).

[mandrill]: https://mandrill.com/
[heroku-mandrill]: https://devcenter.heroku.com/articles/mandrill

---

## Enter Actionmailer

[ActionMailer][mailer-guide] is Rails way of sending email at random.

You *can* `rails g mailer MyMailer` ... there are just 4 important things to know:

1. Configuration
  * Add [settings][mailer-settings] to `config/environments/development.rb, production.rb`.
  * Don't forget to add `ActionMailer::Base.perform_deliveries = true` for testing/production!
  * [BEWARE][beware] OF SPRING! Rails will try to be [too smart][spring].

--

2. Mailers
  * Live in `app/mailers`. `ApplicationMailer` and subclasses like controllers.
  * Have methods that define instance variables and call `mail`.

--

3. Views
  * Live in `app/views/my_mailer/method.html.erb or method.text.erb`.

--

4. Sending an email is done as follows:
  * `MyMailer.my_email(args).deliver_later` (queue for delivery via background jobs, comes with [delivery-options])
    * Sends now if background jobs aren't configured or if you `deliver_now`.

[mailer-settings]: https://devcenter.heroku.com/articles/mandrill#basic-settings
[actionmailer]: http://api.rubyonrails.org/classes/ActionMailer/Base.html
[mailer-guide]: http://guides.rubyonrails.org/action_mailer_basics.html
[delivery-options]: http://edgeapi.rubyonrails.org/classes/ActionMailer/MessageDelivery.html
[spring]: http://stackoverflow.com/questions/25938847/why-are-my-rails-initializers-caching-env-variables-in-the-console-foreman-dev
[beware]: https://github.com/ddollar/foreman/issues/434

---

## That's It!

Hope that was helpful. Y'all feel better?

It's just computers.
