For tonight's assignment, you'll update the Guessr project from class.

This will differ from past assignments in that rather than adding more
code to your labs repo, you'll "fork" the guessr code from the course
organization page, and then "clone" your fork to get a local copy of
the repo to edit.

Note that you'll need to run `rake db:migrate` in your clone to get
the database setup. To run the game just use `ruby lib/guessr.rb`
from the root of your repository.

**ADDENDUM**: We endured some migration bugs and git remote
shenanigans in the course of getting our forks set up. Hooray for learning!

## Normal Mode

There are 2 enhancements to make to guessr:

1. You'll increase the users score when they win a game.
   You may use any scoring system you like.
   I would recommend giving them points as follows:
   100 - (10 * number of turns after the first)

   Note that the user's score is cumulative across games
   so it should never decrease, only increase.

   This code should probably go in the `turn` method in `lib/guessr.rb`.

2. Add a scoreboard method to the Menu class and allow
   the user to select displaying the scoreboard when they "login".
   The scoreboard should rank the users from highest score to lowest.
   Reading the [ActiveRecord Querying guide][querying] may prove helpful.
   In particular, chapters 1-5 and 19 are worth a look.

   This code should probably go in the `Menu` class in `lib/guessr/menu.rb`.

Additionally, reading the first chapter and the belongs_to, has_one,
and has_many sections of the [ActiveRecord associations guide][associations]
would provide good reinforcement of today's lecture material.

## Hard Mode

Enhance the scoreboard to rank users by (total_score / games_played).

[querying]: http://guides.rubyonrails.org/active_record_querying.html
[associations]: http://guides.rubyonrails.org/association_basics.html