In this assignment, we'll investiage a small part of the Github social graph.
Be warned: many of the relevant Github API endpoints have stringent rate limits,
so you might want to save the relevant data to your local machine in order to inspect it.

## Objectives

### Learning Objectives

After completing this assignment, you should:

* Be comfortable getting JSON data from an API
* Have more practice with storing and querying data using ActiveRecord models

### Performance Objectives

After completing this assignment, you should be able to effectively use

* `HTTParty`, at least the `get` method and `basic_auth`
* Part of the Github user API
* Generating JSON by calling `.to_json` on certain ruby objects
* Working with nested hashes
* ActiveRecord saving and querying commands

## Details

Your issue should have 10 github users for you to creep on.
Fork the codecreep repo and finish implementing the described
functionality. **NOTE**: Don't forget to run `bundle` and
`rake db:migrate`!

### Deliverables

* Running `GH_USER=myuser GH_PASS=mypass ruby lib/codecreep.rb`
  starts the app.

  The app prompts the user as follows:

  * Would you like to `fetch` or `analyze`?
    * Typing fetch lets the user enter comma separated
      usernames and data is retrieved from Github until
      we have it all.
    * Typing analyze prints out statistics based on the data
      saved in the database.

## Normal Mode

We'll focus on getting:

1. users in the provided list,
2. users they are following
3. users they are followed _by_ (their followers).

For each user, save at least their:

* Name
* Follower count
* Friend count
* Repo count
* Company
* Homepage

Fetching users should grab as many as it can,
failing gracefully if it hits a rate limit.
I.e. If you start getting a rate limit exceeded messages from
Github, the script shouldn't try to save a user to the database.

Running an analysis should print out a list of the top 10 users
in each of the following categories:

* most popular (most users followed them),
* most friendly (most users they follow),
* most networked (friendly + popular)

with links to their profile and homepage.


## Hard Mode

1. If run multiple times, the script should not fetch any users
   it already has. That is, not only should the database never
   get duplicate users but we also shouldn't ask Github for
   data that we already have.

2. If the script starts hitting a rate limit, it should exit
   early and inform the user when the rate limit resets and
   what it is. Remember that you can do this by inspecting
   the response headers and converting string timestamps with
   `Time.at`.

## Nightmare Mode

3. The script should accept a *depth* to search to.
   In other words, the basic version of the script only
   collects the 10 users passed in and those 10 users'
   friends and followers.

   In normal mode (or with a default depth of 1) the script
   should get the first 10 users, and then get all the users
   that they follow or who follow them. These are the "friends"
   of the first 10 users.

   With a depth of 2, all the users who are followed by or
   follow the "friends" of users of depth 1 should also be
   fetched/imported.

## Notes

* See the [Github API docs](https://developer.github.com/v3/) -  Getting a User and getting a list of their followers are most
  important for this assignment.
* See the [HTTParty docs](johnnunemaker.com/httparty/) and
  our [example from class today][issues].
  If you're still stumped after that, ask someone else, post
  on slack, or ask Vedika or I!
* For a high-level or architectural view of how this app
  might look, see [the solution][solution] I posted to TooDead.

[issues]: https://github.com/TIY-ATL-ROR-2015-May/issues
[solution]: https://github.com/TIY-ATL-ROR-2015-May/too_dead/tree/solution
