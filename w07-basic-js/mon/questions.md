# Devise All The Things

## Description

Pair up with your teammate from the weekend
project, resolve any merge conflicts and get
all work into master.

Then cut a new branch and replace the
existing user and session support in
your app with Devise!

## Details

### Deliverables

Post the link to the branch you and your
teammate paired (or a pull request) when
you close your issue.

## Normal Mode

* Merge in any outstanding branches or pull
  requests, resolving merge conflicts with
  help from Vedika and I if needed.

* Cut a new branch and add the devise gem
  and bundle as seen in class.

* Go through the installation steps for
  devise. You probably already have a User
  model so when you run `rails g devise User`
  the generated migration will require
  heavy tweaking. Feel free to ask Vedika or
  I for help!

* Then remove your old sessions controllers
  and routes, sprinkle `authenticate_user!`
  or `current_user` in your controller code
  as necessary and you're done!
