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

[ports]: http://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers