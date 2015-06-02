## Opening Thoughts

2 notes from the weekend:

1. Is that we're kind of progressing forward through history.
   * Week 1 - Scripting/Imperative Programming (60s-70s)
   * Week 2 - Object Oriented Programming (80s)
     * Xerox PARC. GOOGLE IT!
   * Week 3 - Relational Databases/SQL (80s)
   * Week 4 - HTTP/APIs (90s)
   * Week 5 - HTML/CSS (Views) & Controllers -> MVC! (00s)
2. http://blog.atmartin.io/on-ious-further-reflections-on-the-iron-yard/
   * Process more important than curriculum.
   * You have to Google things forever.
   * The job of Software Engineering is figuring out *how*
     things work that already exist at least as much as figuring
     out how things *should* work that don't yet exist.

## Web Frameworks / MVC

* Web Framework: A set of libraries to handle the basic needs (MVC)
                 of a web app that fit together in a coherent way.
* MVC: The Model View Controller paradigm.
  * Models: Storage of Data, talking to the Database.
  * Views: Display of the Data to users, Rendering HTML.
  * Controllers: Handling HTTP requests, business logic, authentication.
* Using Sinatra today.

## My First Controller! Wheeeee

* `bundle show sinatra` shows us where the code is!
  * Sinatra looks just like our projects. lib folder, there's some stuff in there.
  * And it's only 2000 lines of code! Which is kind of awesome, because we could read it.

* Our first URL with a port! On localhost!
* [Ports][ports]

* A server is just a thing that listens for requests.
* A controller is a set of methods that answer specific requests.
* The application router determines which controller/method go with which request.

* Ultimately, it is the controller's job to receive a request,
  do any work needed talking to the database or models,
  and build a response to send back as HTML or JSON.

[ports]: http://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers

## Sinatra and Miscellany

Sinatra is a bit weird:

* It makes some hard (like answering web requests) easy
  but makes simple things (like what methods are in scope)
  a bit hard. So we're still not sure how to compartmentalize
  our code.

* That said, it's very easy to define a route, just write:
  `get '/hi' do ... end` to define a simple static route.

  To build a route that responds to multiple URLs, just write:
  `get '/hello/:name' do ... end` and whatever URL matches this
  pattern will go to the route. Inside the route's block,
  the variable `params` will be a hash that contains the parameters
  from the user.

* As long as the thing we return from a route is some kind of string
  (like HTML or JSON) everything works just fine.

* Note that until I set `RACK_ENV=production` when running `ruby lib/jukeberx.rb`
  other users cannot connect to the server. It only runs on localhost.

## Extra Resources

Interesting Sinatra reading I've dug up other than the docs is as follows:

* This [blog entry][sinatra_apps] on structuring sinatra apps and
  this [Sinatra app code][monocle] by it's author.
* This [article][mod_v_classic] from the Sinatra site on Modular vs Classic style.

[sinatra_apps]: http://blog.sourcing.io/structuring-sinatra
[monocle]: https://github.com/maccman/monocle
[mod_v_classic]: http://www.sinatrarb.com/intro.html#Modular%20vs. bb20Classic%20Style
