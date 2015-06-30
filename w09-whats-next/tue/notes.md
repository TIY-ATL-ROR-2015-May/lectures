## Good Morning



---

## Harsh Truths

It's time we had a frank, honest, and open discussion.

--

I can't teach you much about Javascript, because I just don't know it.

--

I can read, debug, and modify it with some facility,
but I'm simply not versed in writing it from scratch.

--

I continue to have an enjoyable and fruitful career in spite of this.

--

Still, more frontend experience is on my todo list.

---

## What now then?

I'm sticking to background jobs, mailers, and maybe a JS example or two.

--

1. Today: **Mailers** (for Devise confirmation emails)

--

2. Tomorrow: **Background Jobs** (for library importing)

--

3. Thursday: **Searchbox w/ Autocompletion** (woo JS)

--

But first things first, let's take 30 minutes and clean up the blarg with:

* `form_for`
* Strong Params

---

## Cool. Time for some Magic(tm).

I'm gonna have us collectively do Discovery/Elaboration
for a Magic the Gathering deckbuilding app.

--

Inspiration to be taken from: [deckbox], [magic-cards], [mtg-collect].

[deckbox]: http://deckbox.org/
[magic-cards]: http://magiccards.info 
[mtg-collect]: http://mtgcollectionbuilder.com/

--

Each day I'll lecture for *no more than* 2 hours. Hopefully 1.5.
My goal will be to write a little code showing useful behavior.

--

Then we'll spend the remainder of lecture writing up Issues for
various parts of the project, trying to estimate them and flesh
them out.

--

We'll be broken into 7 pairs each day which will each be
assigned an Issue to work on together.

--

When completed, a pull request should be opened which I
will merge before the issues are assigned the next day.

--

We will use this project to practice writing tests, doing code
review, and getting a feel for the specification process.

--

As a bonus, we'll get more practice doing the most important
things: trying to decompose problems, and writing code.

---

## Enter Planeswalker

* `rails new planeswalker`
* Create dev and test databases for postgres, add Puma and Pry.
* Add devise, bundle.
* Add user model with username, first & last name.
* Really want to add [avatars with paperclip][avatars] but don't think we have time. :-/
  * Maybe a homework ticket?

[avatars]: https://devcenter.heroku.com/articles/paperclip-s3

---

## Enter Email

So it turns out Email sucks. Shocking, right?

Good news: Old protocol called [SMTP][smtp] allows us to send mail without running our own mailservers.

I.e. we could Gmail to send emails on our behalf. ... But that means using our personal accounts. :-/

[smtp]: https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol

--

Better idea: We'll sign up for a service for sending email, [Mandrill][mandrill]!

They have a free Heroku add on (`heroku addons:add mandrill:starter` does the trick) and you get 12,000 messages a month at no charge.

Could also sign up on Mandrill's site and add the info to your `.env` and `heroku config`.

[mandrill]: https://devcenter.heroku.com/articles/mandrill

---

## Enter Actionmailer

[ActionMailer][mailer-guide] is Rails way of sending email at random.

You *can* `rails g mailer MyMailer` ... but there are just 3 important things to know:

1. Mailers
  * Live in `app/mailers`.
  * Much like controllers, there's an `ApplicationMailer` and subclasses.
  * Have methods that define instance variables and call `mail`.
2. Views
  * Live in `app/views/my_mailer/method.html.erb or method.text.erb`.
    * I think, if I'm wrong we'll just see the path when it crashes!
  * Are really boring otherwise, even more so than normal views. :)
3. Sending an email is done as follows:
  * `MyMailer.my_email(foo).deliver_later` (queue it for delivery via background jobs, comes with [delivery-options])
    * Note that if you don't have background workers set up it defaults to sending immediately.
  * `MyMailer.my_email(bar).deliver_now`

[actionmailer]: http://api.rubyonrails.org/classes/ActionMailer/Base.html
[mailer-guide]: http://guides.rubyonrails.org/action_mailer_basics.html
[delivery-options]: http://edgeapi.rubyonrails.org/classes/ActionMailer/MessageDelivery.html

---

## Requirements Time!

