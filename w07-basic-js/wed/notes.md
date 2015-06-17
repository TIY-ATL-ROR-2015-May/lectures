## Getting Ready for Cross-Class Project

Y'all are gonna work in teams of 6-7
people to build a Social Photo Game.
Maybe you can call it clouds?

---

## Getting Ready for Cross-Class Project

The idea:

* Take a picture of a thing with your phone
  and upload it along with what you think it
  looks like.

  Quick note: Not using Rails for the file uploads,
  Frontend/Mobile will send us the URL the image is at.
  We haven't covered file uploads yet but we will.
  Don't worry, that's not the only reason it's
  being handled by Parse. ;)

* Friends can view photos, comment with what
  they think it looks like. First person to
  get it right wins points, answer is unveiled.
  Bonuses for doing it fast, in few guesses, etc.

---

## Getting Ready for Cross-Class Project

Each team of 6-7 will:

* Form a github organization
* Create 3 repos (for backend, frontend, mobile)
* You'll have until next Monday to complete it!

So we have a decent idea of how to write Rails apps
and we've seen how to collaborate with branches and
pull requests.

Moreover, we know how to use Jbuilder to write nice
views for complicated JSON responses.

---

## Two things we still need ...

Things we'll work on today:

* Token Authentication
* Deploying to Heroku

---

## Why Token Auth?

* Devise login sets a cookie to store session info

--

* Great for browser but PITA for API clients! (frontend / mobile)

--

* Instead, have a way for them to sign up,
  get an access token, can use it to make
  authenticated requests via JSON API

---

## How to get Token Auth?

* There used to be a `TokenAuthenticatable` module
  in Devise but they ripped it out. Bad info online.

--

* There are gems like `devise_token_auth`,
  `simple_token_authentication`, and `doorkeeper` but
  they're larger and more complicated than devise itself!

--

* Doorkeeper is the big, official way to write an "OAuth Provider"
  but, well, [let's not][omg-no]. We just need some damn access tokens!

--

* We could hand write a system like the TokenAuthenticatable
  module that used to be in Devise. Jose Valim (the Elixir / Rails Core guy)
  shows how to do it in a gist [here][handrolled] ...

But you might ask if it's really worth it. Good question!

[omg-no]: https://blog.yorkxin.org/posts/2013/11/05/oauth2-tutorial-grape-api-doorkeeper-en/
[handrolled]: https://gist.github.com/josevalim/fb706b1e933ef01e4fb6
[sta]: https://github.com/gonzalo-bulnes/simple_token_authentication

---

## Do we really need Devise then?

Well, what does it give us?

* Auto-generated User Model, Routes, Views, Controllers

--

* But those are all for username/password session-based login

--

* All that's really useful to us for token auth is the email validation

--

* Not much help for a simple Token-based API

We won't be using it!

---

## But is it *Secure*?

* For what? I wouldn't run a billion dollar company on it.
* But this is a weekend project.
* The first step in trying to secure something is coming up with a "Threat Model".
* I'm not super worried about attackers. We could be a bit safer by the handrolled
  Devise solution from Jose Valim posted above. Doorkeeper makes us a full OAuth
  provider, maybe more secure by wildly more complex, has it's own tradeoffs.

Engineering is all about trade offs!

You seem very serious about all this. Here, have a [doge][do-not-want].

[do-not-want]: http://redlinernotes.com/images/do_not_want.jpg

---

## Let's Get Started

Let's just start working on something simple.
I'm going to write an app as a demonstration of
API building but also token auth! Started last night,
tried doorkeeper and promptly vomited.

The app I'm gonna build is called Swapr. It'll
be a place we can post requests for files (like songs, movies, etc)
and people can respond with links to those files
they found elsewhere online. Not *exactly* copyright infringing, right?

**Don't try this at home.**

---

## Oh, and "One Last Thing"

* We should use Postgres instead of Sqlite for our database.
* Because we want to deploy to Heroku and heroku [doesn't support sqlite][no-sqlite].
* But more importantly, we want to maintain [parity][parity] between development and production.

Very simple to switch to postgres:

1. `brew install postgres` at the command line.
   Mac includes sqlite, not postgres. `which psql` should show: `/usr/local/bin/psql`

--

2. Unlike sqlite, postgres is a separate program that needs
   to be running so we can connect to the database.
   To make postgres start each reboot:
   ```
   mkdir -p ~/Library/LaunchAgents
   ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
   ```
--

3. Let's go ahead and start postgres now:
   `launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist`

--

4. Create a new database with postgres by running `createdb my-db-name`.
   Finally, update Rails' `config/database.yml` file, changing the
   adapter line to `postgresql` and the database line to `my-db-name`.

   (Note: Heroku will take care of creating the database on their end.)

[no-sqlite]: https://devcenter.heroku.com/articles/sqlite3
[parity]: http://12factor.net/dev-prod-parity

---

## The Joys of Handrolled Software

Todo:

* Well, we'll write a User model as normal and then write
  the controller for it. When a user gets created, we'll
  be sure to automatically generate a new access token for
  the account!

* Add our own `current_user` equivalent that checks for an access
  token in the current request and returns a User that matches
  that access token or nil.

* And add our own `authenticate_via_user_token!` method to the
  ApplicationController. *sigh* That method should probably
  render a json "Unauthenticated" response if login via token
  is unsuccessful. Because a redirect does us no good. Why not?

---

## And yet we're still not done

* Need to adjust the Rails [CSRF][csrf] (cross site request forgery)
  protection so that it doesn't get mad we send POST requests with
  no `authenticity_token`. So use `protect_from_forgery with: :null_session`
  in `ApplicationController`.

* Finally, it's very important we enable [CORS][cors].
  CORS (cross origin request sharing) enables frontend
  to write a javascript client hosted anywhere that can
  make requests to our backend.
  There are some notes on this in [devise_token_auth readme][devise-token-cors].
  There is also a decent StackOverflow [answer][cors-heroku] that has some heroku specifics.

[csrf]: http://en.wikipedia.org/wiki/Cross-site_request_forgery
[cors]: http://en.wikipedia.org/wiki/Cross-origin_resource_sharing
[devise-token-cors]: https://github.com/lynndylanhurley/devise_token_auth#cors
[cors-heroku]: http://stackoverflow.com/questions/19939207/heroku-rails-4-and-rackcors?answertab=votes#tab-top

---

## JSON relevant things

For very simple responses, it may be easier to write
`render json: { foo: @bar }` than define a JBuilder view. That's fine!

As the response gets more complicated, turn that sucker into a JBuilder view!
See this article if you forgot all about [how to jbuilder][how-to-jbuilder].

--

**Note:** `render` takes a `status: :status_name`
option that recognizes the following [codes][status-codes].
In RESTful API design, we try very hard to send back an
appropriate status code so the user knows what happens on the server.

Popular codes:

* 200 - OK, that went well
* 201 - Created, cool we made that for you
* 401 - Unauthenticated, you better login
* 403 - Unauthorized, you don't have permission to do that
* 404 - Page Not Found, sorry this object doesn't exist
* 422 - Unprocessable Entity, your data is garbage buddy

[how-to-jbuilder]: http://www.multunus.com/blog/2014/03/using-jbuilder-instead-erb-rendering-json-response/
[status-codes]: http://apidock.com/rails/ActionController/Base/render#254-List-of-status-codes-and-their-symbols

---

## Testing

Just use [Postman](http://www.getpostman.com/), way more pleasant than curl and HTTParty!

Vedika and I will be here to help answer questions.
Remember, no lecture tomorrow or Friday.
Just y'all learning by writing code and us answering questions. :)

---

## Deploying to Heroku

There's a nice [getting started][heroku-start] guide.

#### tl;dr

Since we already got postgres ...

1. Install the heroku toolbelt!
2. Go to your rails repo on the command line.
3. Add rails_12factor gem, specify ruby version. `bundle`!
4. `heroku login` and `heroku create`. Now your repo has a heroku git remote!
5. Push your app with `git push heroku master` and don't forget
   to migrate it with `heroku run rake db:migrate`!
6. Finally, you can start your app with `heroku ps:scale web=1`.

* You can push updates to your heroku instance with `git push heroku master`.
  No need to restart the workers. It "just works"!

[heroku-start]: https://devcenter.heroku.com/articles/getting-started-with-rails4

---

## Your Life in Production

Notes about things that are different in prod:

* You can run migrations on heroku with `heroku run rake db:migrate` and
  the rails console with `heroku run rails c`.
* You shouldn't EVER `binding.pry` so you have to reproduce bugs locally or look at log files.
* You can use `heroku logs` to see recent logs or `heroku logs --tail` to watch
  them live as requests hit the server!
* There's also a rails command called `rails dbconsole` that will connect you
  to the SQL database! Be careful, working with live ammo here.
* [Billing model][billing] is free with just one web worker/dyno per month.
  Some additional notes about [postgres][postgres] worth peeking at.
* [Email support][email] is an add-on that we ain't payin for.

[billing]: https://devcenter.heroku.com/articles/usage-and-billing#billing-cycle-current-usage
[postgres]: https://devcenter.heroku.com/articles/heroku-postgres-plans
[email]: https://devcenter.heroku.com/articles/smtp

---

## Let's Talk about Workflow with Other Teams

* You're responsible for data. You need to document your APIs!

* It's important to let the other teams have an idea of what
  data you'll provide soon so they can start working.
  They can mock up test data if they know something about
  what your requests and responses look like.

---

## Homework

Start your app by getting a repo up under the github organization,
and deploying it to heroku with support for creating and deleting users via JSON API.

I'll put up a questions.md ASAP!

### Additional Resources

* Heroku would love to tell you about how you should use Puma as your underlying
  app server instead of Webrick. Not necessary for this project but it's not a hard
  change to make! Just add `gem 'puma'` to the gemfile and write a "Procfile".
  See [this guide](https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server).
* A half-decent Rails [API slide deck][api-slides] by a Uni of Texas CS Grad Student

[api-slides]: http://sudharti.github.io/rails-api-presentation/
