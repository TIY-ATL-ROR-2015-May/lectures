### Good Morning!

--

![alcohol](http://media.giphy.com/media/vyZBKDpUC0niE/giphy.gif)

---

### Good Morning!

![enjoy](http://wac.450f.edgecastcdn.net/80450F/starcrush.com/files/2013/08/pr-8.gif)

---

Lots of commentary about "understanding your part" yesterday afternoon.

Two thoughts on that:

* [Alan Perlis is the man](http://redlinernotes.com/docs/talks/opa.html#7)
* [Fiona's corollary](https://twitter.com/fioroco/status/612722273271869440)

---

## A reminder to Read the Docs

You can understand this stuff now.

And there's no way I'm gonna exhaustively cover
every option and setting in class. There are just too many.

Today's assignment: Rails Routing guide, Chapters:
* 2.6
* 2.8
* 2.9
* 2.10

* 4.1, 4.2, 4.3

---

## And Now For Something Completely Different ...

### Swapr

A quirky, private (but probably insecure) file-sharing service!

We'll just focus on the API.

---

## A Quick Spec

(Today's target)
* Users can sign up.
* Test all the things!
* Users can upload files.

--

(Tomorrow's target)
* Users can request access to other users files/have friends or similar.
* If access is granted, they can download each other's files.
* Also, notifications are sent by text message / twilio.

---

## Walkthrough

### Some Boring Setup Things

* Users can sign up and login.
  * Done in 15 minutes with Devise of course.

--

* Remember, gotta create a database with `createdb swapr-dev`
  (and a test database with `createdb swapr-test`)
* We can access the psql prompt with `rails dbconsole`

---

* We'll even switch to [Puma][puma] since Heroku [likes it][heroku-web].
  * Puma is a faster webserver than the default (webrick).
  * The big switch here isn't the Gem, it's using a `Procfile`
    and `foreman` to manage running our rails app.
  * We also install a gem (not with bundle!) called [`foreman`][foreman]
    to use the procfile and set up environment variables as
    needed based on a `.env` file in our project directory.
    This will be nice when we start adding S3 Buckets or API keys.

[foreman]: http://blog.daviddollar.org/2011/05/06/introducing-foreman.html
[heroku-web]: https://devcenter.heroku.com/articles/getting-started-with-rails4#webserver
[puma]: http://puma.io/

---

### And More Interesting Functionality ...

### Now Avatar!

* Users have avatars via paperclip!
  * Maybe tagline/bio/bday/homepage/twitter/location? *sigh*

1. Install imagemagick with brew so paperclip can resize things.
   `brew install imagemagick` (heroku already has imagemagick installed)

--

2. Add [paperclip][paperclip] gem.

--

3. Add forms, views, talk about image_tag a bit perhaps.
   Don't forget to talk about `:multipart => true`.

[heroku-paperclip]: https://devcenter.heroku.com/articles/paperclip-s3
[paperclip]: https://github.com/thoughtbot/paperclip

---

### Oh nooooes! We need a new storage adapter!

This works fine for local, but sucks on Heroku.
Files aren't accessible across multiple servers/dynos!

--

We'll store them on S3! Three good reasons:
  1. S3 is faster than Rails at serving static assets (i.e. images, files).
  2. Heroku is "horizontally scalable". I.e. Just run more servers to
     meet demand. But this means you can't store the files on the filesystem
     because the other servers wouldn't be able to get to them. If you're worried
     about sharing data via the database, it is actually hosted on another
     machine in production anyway.
  3. It's really cheap and durable. :D

---

### So S3 Then?

Heroku has a nice writeup with more about getting started
with S3 [here][heroku-s3].

[heroku-s3]: https://devcenter.heroku.com/articles/s3

### S3 has a [Free Tier][free-s3]. So ... Good News.

Sign up! Cancel it anytime you want.

* You'll get an Access Key and Secret Key, like most APIs.
* Files are stored in "buckets".
* S3 isn't *actually* a file system. There are no folders.
* We "fake" folders by having files with slashes in the name. S3 don't care.
* Files can be privately or publicly available.
  You can also generate temporary public links, etc.

**Don't forget to create a bucket!**

[free-s3]: https://aws.amazon.com/free/

---

### Now add a Ruby S3 Library

1. Add the `aws-sdk` gem to the gemfile to interact with S3
   and other Amazon Web Services.
2. Add `S3_BUCKET`, `AWS_ACCESS_KEY`, and `AWS_SECRET_ACCESS_KEY` to `.env`.
3. Add an initializer to setup the AWS gem based on those values.
4. Mirror the changes to `.env` on heroku via `heroku config:set FOO=bar`.
5. Add some paperclip settings to `config/environments/production.rb`
   as seen in [le Heroku guide][heroku-paper-config].
6. You should probably mirror them locally in
   `config/environments/development.rb`
   so we can test without deploying to Heroku. :)

We're done!

[heroku-paper-config]: https://devcenter.heroku.com/articles/paperclip-s3#configuration

## Tomorrow

Invites, downloading files from S3, and twilio!
