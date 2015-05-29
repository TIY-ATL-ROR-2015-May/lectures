# commit-champ

## Description

Pull and aggregate commit statistics from Github


## Objectives

### Learning Objectives

After completing this assignment, you should…

* Be able to make HTTP requests from Ruby
* Be able to iterate through the nested JSON responses that most APIs will return
* Have some understanding of OAuth and Authentication through Request Headers
* Know how to model and store Many-to-Many objects

### Performance Objectives

After completing this assignment, you be able to effectively use

* HTTParty (or similar) for making requests
* Parsed JSON responses
* `has_many through` associations in ActiveRecord

## Details

### Deliverables

* A fork of the `commitchamp` repo.

### Requirements

Running `ruby lib/commit_champ.rb` (or `OAUTH_TOKEN=foobarbaz ruby lib/commit_champ.rb`) should:

* Prompt the user for an auth token if `ENV['OAUTH_TOKEN']` is nil
* Ask the user to choose an existing repo or fetch a new repo
  * If Existing:
    * Show existing repos in the database.
    * Let the user pick one and print a list of contributors ranked by lines added + lines deleted
  * If New:
    * Prompt the user for a github organization & repo to report on
    * Print a table of contributions

## Normal Mode

Get the list of [contributions][contributors] for the specified repo. Save each user in
the database and keep a record of their contributions. You don't have to track contributions
by week, just sum them to get the total number of: lines added, lines deleted, commits made.

[contributors]: https://developer.github.com/v3/repos/statistics/#contributors

Your table should look something like

```
## Contributions for 'owner/repo'

              Additions     Deletions     Changes
User 1            13534          2954        6249
User 2             6940           913        1603
...
```

## Hard Mode

* Allow the user to specify just an organization. Add *all* it's repos.
  Be mindful of rate limits!

## Nightmare Mode

* Instead of getting the contributions for the repos of the organization,
  get a list of the [organization members][members], then for each member
  get a list of _all_ their public repos, then get all the contributions
  for each of those repos!

[members]: https://developer.github.com/v3/orgs/members/#public-members-list
