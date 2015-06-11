
API and Stuffff
## User
GET /users/new # show me the new user signup form
POST /users    # the form action for signup, creates a user

## Sessions
GET /login     # show the login page
POST /login    # set the user id in the session if password checks out
DELETE /login  # remove user id from session

## Links
GET /links/new # show the form for a new link
POST /links    # the form action for new link, creates a link (if logged in)
GET /link/:id  # takes you to the thing it links to

## Comments
GET /link/:id/comments  # get the page for a link, its comments, and comment form
POST /link/:id/comments # the form action for new comment, creates a comment (if logged in)

Schemas and Thangs
## User
* has_many :links
* has_many :comments (comments a user has made)
* Email:string
* Password:string

## Link
* has_many :comments (comments made about a link)
* user_id:integer / belongs_to :user
* destination:string
* title:string
* timestamps (but rails g Model will give us that) / created_at

## Comment
* user_id:integer / belongs_to :user (author of the comment)
* link_id:integer / belongs_to :link (link the comment is about)
* content:text

### HARD MODE CHANGES

## Votes
* user_id:integer / belongs_to :user
* link_id:integer / belongs_to :link
* score (validation that score is -1 or +1)
  * validates :score, inclusion: { in: [1, -1] }

## Link
* has_many :votes (votes made about it)

## User
* has_many :votes (things they voted for)
