# Morning Ya'll

Hope you had a good weekend.

I'm pretty sure all I did was work and adult things.

So sorry if I'm a bit grumpy.

---

# This Week Is Intense, Deep Breath

3 lecture days for 4 days of material.

--

May have to do some morning lecture Friday, worst case.

--

Gonna work hard to avoid it if possible.

---

# Progress Reports

* Progress reports were sent out last night. If you have questions or haven't gotten yours, grab me in lab.

--

* Reminder that 1-on-1 meetings are an option but review is also a great place to recap concepts we're still struggling with.

--

* No time to go over homework now, it is up on github.

---

# Let's Reflect for a Minute

I want to hear:

* A programming concept you feel good about
* A programming concept you feel bad about
* And someone who has helped you make a breakthrough

---

# Three Quick Thoughts

1. It's important to distinguish between the definition of a thing and it's *use*.
   I feel like this lack of distinction between when and where we define things vs
   when and where we use them has tripped us up in particular the last two weeks (Classes and Models).

--

2. Broad exposure more useful in terms of having better ideas of how to solve things
   than insane depth. So try different languages, solve non-web problems after you
   learn Rails. When all you have is a hammer, everything looks like a nail. Sapir-Whorf, etc.

--

3. Read a bit of "The Inner Game of Tennis". Trying too hard is possible and actually
   degrades performance. Additionally, unconscious imitation of me may be better than
   me reiterating with words a lot. Immersion / watching preferable to taking notes, copying my code.

---

## And Now For Something Completely Different

Let's Talk About The Web

![internets](http://img.pandawhale.com/55888-Abed-quote-EHNc.gif)

---

## Where are them servers?

* DNS / Name Resolution

redlinernotes.com isn't a "real" place

74.207.227.162 is the server's IP address

--

* IP Addresses

An IPv4 address is any group of four "octets"

0.0.0.0 up to 255.255.255.255

--

* What do I need to know?

DNS exists to map Domain Names to IP addresses.

We usually substitute domain names with all our
tools since they're easier to remember but IP
works just fine.

---

## How do we interact with them?

* Talk to them with a web browser, or better,
  an HTTP client
  * curl (command line tool, installed by default on mac/linux)
  * [httparty][httparty] (ruby library)

[httparty]: http://johnnunemaker.com/httparty/

---

## HTT What now?

* Hyper Text Transfer Protocol

Very simple idea:

* Client makes a **request**, Server sends a **response**

* Response has two important pieces: status code and body.

* HTTP Methods ( different kinds of requests )
  * GET - Retrieve existing thing(s)
  * POST - Create a new thing
  * PUT - Update an existing thing
  * DELETE - Remove an existing thing

---

## So about those responses...

* Important HTTP [Response Codes][http_codes] (aka Status Codes)
  * 200 - OK / 201 - Created
  * 401 - Unauthorized
  * 404 - Page Not Found

* The broad response code categories
  * 2xx - Success
  * 3xx - Redirect
  * 4xx - Client made a mistake
  * 5xx - Server made a mistake

[http_codes]: http://en.wikipedia.org/wiki/List_of_HTTP_status_codes

---

## What can we do?

Well, that sort of depends on what API we want
to use.

API - Application Programming Interface

--

Really just that last word is important.
It's an interface. You've been reading API
docs this whole time for ActiveRecord and
Ruby. An API is just a contract that says,
"if you do this, i'll do that".

--

Any serious web service offers some sort of
public API. We'll look at Github's in a minute.

Two quick things before we do. You're going to
hear the words REST and JSON a **lot** so...

---

## What the hell are REST and JSON?

### JSON - Javascript Object Notation

Just a serialization format.

Like YAML, XML, others.

#### Got some text in JSON?

`require 'json'`

`JSON.parse my_text`

You get a hash table back.
Not much more to it really.

---

## What the hell are REST and JSON?

### REST - Representational State Transfer

Much like "Object Oriented", there is no precise and widely
accepted definition which leads to a lot of feels on the net.

For now, don't worry too much about REST.
We'll talk about it more a little later in the course.

---

## Aside: Exception Handling

Things can go wrong here, right?
* Suddenly dealing with 'distributed systems'
* What if the network goes down?
* What if the server decides we're bothering it too much?

--

We need to handle it gracefully! When things go wrong,
an exception is thrown.

---

## Exception Handling in Ruby

Often known as `try / catch` or similar in other languages.

Done with `begin / rescue / end`. A few rules:

* __Always__ name a specific exception class you're
  trying to rescue from. Otherwise *any* old error
  will be swallowed up. If you let it "bubble up",
  some other part of your program may know how to
  handle it. For example, RecordNotFound in Rails.
* You *may* bind the exception to a variable for
  inspection / logging / etc.
* You may use multiple rescue blocks to catch
  catch different kinds of exceptions.
  I.e. I probably want to handle network outages
  and 404 pages differently.
* Rescue blocks generally come at the end of a
  method.

I'll write a quick example where I recover from an
UndefinedLocalError or trying to divide by zero.

---

## Finale: Let's build a github scraper!
