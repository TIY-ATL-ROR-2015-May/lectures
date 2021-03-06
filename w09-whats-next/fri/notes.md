## The Last Lecture

--

![what](http://gifrific.com/wp-content/uploads/2015/01/Leslie-Knope-Saying-What-Parks-and-Recreation.gif)

---

## The Last Lecture

![text-me](https://s-media-cache-ak0.pinimg.com/originals/21/04/77/210477063097065ba8c06d9c4ee882dd.gif)

---

## Today's Topics

1. File Uploads
2. Background Jobs
3. (Incidentally) The `if @foo.save` pattern

--

The first two are "bigger" topics. The third is more of a "while we're here I should mention".

---

## To Trevor's Point

We can add arbitrarily complex features to any piece of software!

--

Blarg is the most complicated non-weekend project we've built so far.

--

That's because I keep using it as a vehicle to teach us every damned Rails thing.

---

## So File Uploads

Let's add Avatars to blarg! Every user must have a pretty profile picture!

--

We can display it on the posts.

--

And, bonus, we can pretty much just follow this [article][heroku-paperclip] to do it.

[heroku-paperclip]: https://devcenter.heroku.com/articles/paperclip-s3

---

## To Recap ([Originally](https://github.com/TIY-ATL-ROR-2015-May/lectures/blob/master/w08-advanced-rails/wed/notes.md))

### Setup Work

Blech.

1. `brew install imagemagick` if you haven't. Now we can resize/crop/adjust images!
2. Sign up for an S3 account, create "buckets" for development and production. Just like we would with databases.
3. Add `S3_BUCKET`, `S3_BUCKET_DEV`, `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` or whatever to `.env`
   and heroku with `heroku config:set`.
4. Add `paperclip` and `aws-sdk` to the Gemfile.
5. Add paperclip settings to `config/environment/{development,production}.rb`

---

![cool-cool-cool](http://24.media.tumblr.com/tumblr_ltjf1iRJ011qzmprzo1_500.gif)

### Uploads Work!

Now we can just worry ourselves with [paperclip][paperclip] stuff.

--

It's set up to use S3, the rest is just forms, migrations, familiar things.

--

1. Add an "attachment" migration to the model we want.
2. Add a declaration and any needed validations on the model.
3. Add a form, make sure to make the form 'multipart/form' encoded!
4. Save you some files! They'll go straight to S3.

*Note*: If you want to offer users the ability to download them, Rails has a method called `send_file`.

That's it.

[paperclip]: https://github.com/thoughtbot/paperclip

---

## But Background Jobs ...

Are a bit complicated, yes.

--

Remember that the point of background jobs is that they let us run potentially long computations outside of Rails.

--

Because ActiveJob was introduced rather recently (in Rails 4.2) it can be difficult to find good resources on background jobs.

--

Two best resources I've seen are [this article][engine-resque] and the Rails [Active Job guide][aj].

[engine-resque]: https://blog.engineyard.com/2014/getting-started-with-active-job
[aj]: http://edgeguides.rubyonrails.org/active_job_basics.html

---

## Background Requirements

Background jobs require additional processes running on our computer besides Rails and the database.

* Redis - A message queue to send requests for Jobs to be done
* Resque - A job pool/manager

--

Add some gems: `resque`.

--

Add some routes: `mount Resque::Server.new, at: "jobs"`

--

May want to protect this. See [here](https://github.com/resque/resque/wiki/FAQ#how-do-you-protect-resque-web-with-devise).

---

## The Real Complications

* When do the jobs run?

--

* How do I know if they failed?

--

* What is loaded when the jobs run?

---

## Background Jobs (Setup)

You'll need to `brew install redis` if you haven't.

--

You'll need to configure Resque to find Redis and the Database.

--

More setup may be required if you want to be able to schedule jobs in the future or recurring times.

--

I have experience with the [clockwork] gem and liked it. [resque-scheduler] is also a thing.

--

Remember to add entries to your `procfile`! At least:

* `redis: redis-server`
* `resque: QUEUE=* rake environment resque:work` (or resque:workers with a `COUNT=n`)

--

And *tell Rails* which queue you're using in `config/application.rb` or an initializer: `config.active_job.queue_adapter = :resque`

[clockwork]: https://github.com/tomykaira/clockwork
[resque-scheduler]: https://github.com/resque/resque-scheduler

---

## Background Jobs (Usage)

1. Define a job in `app/jobs/my_job.rb`
2. Give it a queue with: `queue_as :foo`
3. Give it a perform method with any needed arguments: `def perform(bar) ... end`
4. Call it from controllers or clockwork to schedule jobs. `MyJob.perform_later`

---

## Backburner

There are also these articles you might refer to for more context or information:

* http://feministy.io/deploying-rails-41-apps-with-resque-to-heroku
* https://devcenter.heroku.com/articles/queuing-ruby-resque
* https://devcenter.heroku.com/articles/clock-processes-ruby

--

On heroku, you'll need to add the RedisToGo addon and might need to tweak some configuration. Not too bad.

--

Heroku does unfortunately charge for background job workers. :-/

---

## Fin

![slow-clap-plz](http://media.tumblr.com/d7f9f0c63d922f6da5c00cdb6fa1a667/tumblr_inline_nkbe5dJ8t71qfwhgs.gif)
