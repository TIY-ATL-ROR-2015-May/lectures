# Good Morning

## First things first ...

### Take a deep breath ...

---

# About this weekend ...

* I know how it feels.

--

* Programming is so **tumultuous**.

* One moment you understand everything.

--

* You're in sync with the machine, capable of *magic*!

--

.center[![magic](http://i.imgur.com/o0vd1Jg.gif)]

---

# And then ...

* Just as you begin to fly ...

* [Disaster strikes!](http://i.imgur.com/Jdt1rRf.webm)

--

* I know it's discouraging. And exhausting.

.center[![exhausted](http://i.imgur.com/zyk2jFL.gif)]

---

# Have Faith

* You're gonna find your way.

--

* Even if you're down in the dirt right now.

.center[![digging](http://i.imgur.com/3EgAGkP.jpg)]

---

# Feel Better?

* I may have misestimated the edge on this one. Estimation is hard.

--

* How many people actually got a game of Tic Tac Toe working?

---

# Preliminaries

1. Write down a concept you're really struggling with and feel like you don't get.

2. No quiz today. Maybe tomorrow. We're all a bit fried, I suspect.

3. Course work, post-work, etc.

---

# Introducing Bundler and Libraries (Gems)

* `bundle gem $NAME` scaffolds out a project called $NAME for you.
  * Since it autogenerates folders and code, we avoid spaces, dots, colons, dashes, etc
    in our project names. We generally stick to lower case, too.

--

* Tweak the gemspec quickly. Gemspec is mostly for publishing to rubygems.
  * Making a gem is not magic! (But we won't see that today.)

--

* Add `sqlite3` and `activerecord` gems. Put `pry` in the development group.

--

* Run `bundle` in the project directory and it grabs all the libraries we need.
  * Commit!

---

# Databases

* Various databases out there: sqlite, postgresql, mysql, oracle, mssql

--

* We're going to use sqlite this week. Will switch to postgresql later on.

--

* Sqlite is already installed on your macbooks, hooray!

--

* ... but we still need to tell ActiveRecord how to talk to it.

---

# Some Basic Config Gunk

* ActiveRecord is the same database library Rails uses.

--

* We configure it just the same as we would a Rails app:

  * Configuration goes in a file called "config/database.yml".
  * Migrations go in a "db/migrate" folder.
  * Add a Rakefile with a task to run your migrations.
  * We need to start a connection to the database in our code.

--

* All this is shown in the following gist:
  * [example active_record setup][example_ar]

--

* One last thing:
  * Sqlite stores database in the file specified by database.yml
  * You can delete it to "wipe" the database. Good for learning.
  * Probably worth adding "db/foo.db" to your `.gitignore`

[example_ar]: https://gist.github.com/redline6561/51fe3f9a359307cbdc59

---

# But why Database?

* (Remember: Historical context is important!)

--

* A couple of reasons ...

--

1. Companies needed multiple users to be able to see/update data
   *simultaneously* and *reliably*. (I.e. concurrency is hard)

--

2. Programming languages and hardware were in wild flux for a long time.
   Databases act as a long-term data storage technique. Any language that
   has a SQL library (that's basically all of them) can talk to the database.

--

3. They have better speed and support for querying, etc, than files and custom formats.

---

# Schemas, Migrations, Models

* To have a class that can be saved in the database we have to do a few things.

--

1. The class must subclass `ActiveRecord::Base`.

--

2. The class **must not** define an `initialize` method. We'll see why shortly.

--

3. We have to add the model to the database "Schema".

--

4. All changes to the schema *must* be made by "Migrations".

--

* Let's write one and talk a bit about the schema file ...

---

# CRUD - Create / Read

## Create
* Full::PathTo::ModelClass.new (or .create which also saves for you)
  * Pass keyword arguments for all columns

## Read
* Full::PathTo::ModelClass.stuff
  * count ( get the number of records in the table )
  * all ( return an enumerator for everything in the table ) USE WITH CAUTION!
  * where ( return an enumerator for everything matching the clause )
  * find (return a model instance by id)
  * find_by_$ ( return a model instance by column )
  * find_each ( return each model instance in turn )

---

# CRUD - Update / Delete

## Updating ( good old accessors / update_attribute / update_attributes )
* model_instance.stuff (call it toy)
  * toy.name = 'foo' ( aka good old accessors, must be followed by toy.save )
  * toy.update_attributes :name => "foo" (saves for you, any number of attributes)

## Deleting ( delete / destroy )
* model_instance.stuff (call it toy)
  * toy.delete ( only kills it on the database side )
  * toy.destroy ( kills it database side, nils the ruby object, runs arbitrary helper code )

---

# HW

I'm likely to write up something migration focused. We'll see!

Questions.md will be posted by 1:45, Github issues by 2:00, review at 2pm!
