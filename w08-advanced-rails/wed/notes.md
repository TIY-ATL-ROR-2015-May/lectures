## Welcome Back to Week 8

![center](http://i.imgur.com/f7rJAZ7.gif)

---

## In Review ...

How do you do files uploads?!? Well ...

* First, sign up for an Amazon Web Services (AWS) account.
  You should get an Access Key and Secret Access Key.
  Also create a unique bucket on S3.

--

* Add `paperclip` and `aws-sdk` to the Gemfile and bundle.
  * Optionally, switch webserver to `puma` for MOAR SPEEDZ.
* Run `gem install foreman`, or add it to the Gemfile and bundle.

--

* Add `Procfile` & `.env` files, and add `.env` to `.gitignore`.
* Define a bunch of environment variables in `.env`:
  `S3_BUCKET, S3_BUCKET_TEST, AWS_REGION,
   AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY`

--

* Finally, do something I [*forgot*][forgotten] yesterday:
  Add `paperclip.config_defaults` hashes to
  `config/environments/development.rb, production.rb`.

Whew! Now you can just use Paperclip as [their README shows][pc-rdm]
to add an attachment in a migration and define helpers for it on the
model.

[forgotten]: https://github.com/TIY-ATL-ROR-2015-May/swapr/pull/6
[pc-rdm]: https://github.com/thoughtbot/paperclip

---

## So About Last Night

* Let's have a read through the code I wrote!

  ( And we'll try to get done with last night's code by 10:30am. More to do! )

:)

--

1. [Wrote a bunch of tests.][moar-tests]
2. [Added a Folder model so we can group files][folders]. see: [acts_as_tree][tree]
3. Wrote a ContrabandController:
   * List, Create, Get, Edit, Delete
4. Wrote a FolderController:
   * List, Create, Get, Delete
5. Wrote controller tests!

[folders]: https://github.com/TIY-ATL-ROR-2015-May/swapr/pull/8
[moar-tests]: https://github.com/TIY-ATL-ROR-2015-May/swapr/pull/7
[tree]: https://github.com/amerine/acts_as_tree

--

* Files can be renamed/moved by simply editing them and
  specifying a different containing folder.
* Similarly, we can rename folders by just editing them
  and changing their parent folder.
* In neither case is there any need to update the way the files are stored on S3!
* Deleting a folder deletes all folders and files contained within.

---

## Today's goals:

1. Add some sort of vaguely secure sharing system.
2. Add text notifications via Twilio!
3. Add explicit sharing options to send stuff to a friend?
4. Maybe talk about how to enhance security a bit?

I'll probably need:

1. http://docs.aws.amazon.com/sdkforruby/api/Aws/S3/Object.html#presigned_url-instance_method

---

## Other Things Worth Mentioning

* Links aren't one time use.
* Single-threadedness, large file uploads, etc.
* The streaming model alternative.
* A brief aside on [include vs extend][in_v_ex]

[in_v_ex]: http://www.railstips.org/blog/archives/2009/05/15/include-vs-extend-in-ruby/

--

## Q & A / Homework

Tentatively:

I'll break you up into pairs. Each pair will take a controller or model
from the blarg project and submit pull requests to test it!

---

## Additional Reading

Naturally, there's a blog article somewhere with a [dropbox clone][tutorial]
written in Rails.

There's also a project on Github someone started called [boxroom][boxroom].

Also, I kind of forgot [reddit][reddit] is open source and up on github.
A few notes about that:
  * Their source code is 200kloc of Python, but they use a tiny framework
    called Pylons, not a big one like Django or Rails.
  * Couldn't find many tests, maybe in another repo somewhere?
  * Poked through their user model and a controller or two.
    Gives you a feel for the size of an "industrial" app.
    Again, finding the code to change is the hard part.
  * Don't worry, your first job's codebase won't be 200k in all likelihood. :)

[reddit]: https://github.com/reddit/reddit
[boxroom]: https://github.com/mischa78/boxroom
[tutorial]: http://code.tutsplus.com/tutorials/build-a-dropbox-like-file-sharing-site-with-ruby-on-rails--net-17940