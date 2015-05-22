# Too Dead

Build a basic terminal todo app.
I've provided most of the application skeleton in [too_dead][too_dead].
You'll want to fork and clone it and push all work to your fork.

[too_dead]: https://github.com/TIY-ATL-ROR-2015-May/too_dead

## Installing / Running / Databases / Migrating

First, four important notes:

1. **Installing:** To get the dependencies you will need to run `bundle` after you clone.

2. **Running:** You should use `ruby lib/too_dead.rb` to run and test the code.

3. **Databases:** The database is [configured][db_config] and will be stored in `db/too_dead.db`.

4. **Migrating:**
   To write a migration, much like the [ActiveRecord Migration guide][migrations] says,
   you'll add a numbered file to the `db/migrate/` directory of the app with a class
   that inherits from `ActiveRecord::Migration` and `up` and `down` methods as we've
   seen in class. I have put in the [first migration][create_users] to create the
   `User` table.

   There is a "rake task" for running the migrations that you can call as follows:
   `rake db:migrate`. You may optionally pass it a `VERSION=001` argument that will
   migrate to the version specified. This should match your file numbering.
   We'll talk more about "rake tasks" at a later date, but if you're curious please
   have a quick peek at the [Rakefile][rakefile] and you'll see there's no magic. :)

[db_config]: https://github.com/TIY-ATL-ROR-2015-May/too_dead/tree/master/config/database.yml
[db_init]: https://github.com/TIY-ATL-ROR-2015-May/too_dead/tree/master/lib/too_dead/init_db.rb
[migrations]: http://guides.rubyonrails.org/migrations.html
[create_users]: https://github.com/TIY-ATL-ROR-2015-May/too_dead/tree/master/db/migrate/001_create_users.rb
[rakefile]: https://github.com/TIY-ATL-ROR-2015-May/too_dead/tree/master/Rakefile

## Your Tasks

1. You will need to add todo list models and todo item models.
   You will need to write one migration for each model. (Except Users which I wrote.)

   A todo list really just needs a title.
   A todo item should have at least:
     * a name,
     * a due date,
     * some sort of completed/finished/done column.

   Remember you have access to the [ActiveRecord Migrations guide][migrations] to help you!

[migrations]: http://guides.rubyonrails.org/active_record_migrations.html

2. Once the tables and (empty) models are in place, you'll want to define any needed    associations on the models like `has_one`, `has_many`, `belongs_to`, etc.
   Remember to think about 1-to-1, 1-to-many, many-to-many!
   (Hint: There is no need for many-to-many relationships in Normal mode.)

   Remember you have access to the [ActiveRecord Associations guide][associations] to help you!

3. User functionality:
   * You can login with your name, a new user is created if one does not already exist.
   * You can delete your account.

4. Todo list functionality:
   * You can create a new todo list.
   * You can delete an existing todo list.
   * You can pick a todo list to edit or update.

5. Todo item functionality:
   * You can create a new todo item which optionally has a due date.
   * You can mark a todo as done or undone.
   * You can change the due date for a todo.

## Hard Mode

1. You can show or hide finished todo items.

2. You can view overdue todo items.

3. When lists are deleted, all todo items should also be deleted.
   When accounts are deleted, their lists and items should be deleted.
   There may be an easy way to have this handled. Check the [associations guide][associations].

[associations]: http://guides.rubyonrails.org/associations.html

## Nightmare Mode

It's possible to envision a scenario where a Todo does not fit neatly into
a single list/category such as "Personal", "Health", "Finances", "Work", etc.

1. Go crazy and add a TodoTag model and Tag model. Make a many-to-many
   and ways to view todos by what they're tagged with.