### Congratulations

We are officially in the home stretch.

Welcome to week 9.

--

![party-time](http://media2.giphy.com/media/hsBZfDG7wiWHu/giphy.gif)

---

### Final Projects

2 big notes here:

1. Group projects are *strongly* encouraged for the best possible final project.
   Any individual projects need sign off by *ALL* of the instructors.

2. If you have a final project idea you want to create, awesome.
   You will be able to pitch your idea to your fellow --students-- hackers tomorrow at 2pm.
   If you don't have an idea, fantastic! See if any of the pitches grab you.

---

### An Apology

I hate the lack of respect that was shown for your time and effort.

A basic ranking from 6 to 1 when each group had
different pitches with differing levels of ambiguity is simply asinine.

I'm proud of your efforts and how far you've come in 8 weeks. You should be too.

That SolTech Q&A was not planned. They just decided to do it.

There are various things they said I disagreed with.

**Remember:** They are _one_ tech company. Others differ.

---

### Where We're Headed

Two big topics this week:

* Javascript
  * This means we need to talk just a *bit*
    about The Asset Pipeline and Turbolinks.
* Background Jobs
  * We will probably see emails as an *example*
    of a background job. Shows us Mailers as a bonus.

A few minor Railsisms will be covered by accident hopefully:
* `form_for`
* Strong Params 

Project?

* Still hoping we can do a Magic the Gathering deck builder or similar.

* There is no weekend project so this is my last opportunity to have us
  do a large chunk of meaningful work before final projects.

* I'll be prototyping and planning tonight. Pondering hour and a half lectures
  each morning followed by reviewing pull requests and assigning cards for
  the next evening.

---

### Today

4 perspectives on Javascript:

* Info Smash: I'll drop a whole bunch of things on your head.
* Historical: JS is defined by the browser wars.
* Standalone: We'll look at a Spotify example of a JS app and talk through the code a bit.
* Railsified: Rails UJS makes some simple JS things easy.

Project:

We'll update the blog to do AJAX comment submission and post update.

Homework:

* There won't be any tonight.
  (If y'all feel really strongly about this we can discuss it.)

---

### Info Smash

[Javascript vs jQuery vs DOM][js-jquery-dom]

(I should also mention [You might not need jQuery][no-jquery])

Let's blow through Tim's notes super fast!

* https://github.com/tiy-atl-js-q1-2015/Notes/blob/master/Week%2002/Tuesday.md
* https://github.com/tiy-atl-js-q1-2015/Notes/blob/master/Week%2002/Wednesday.md
* https://github.com/tiy-atl-js-q1-2015/Notes/blob/master/Week%2002/Thursday.md

[no-jquery]: http://youmightnotneedjquery.com/
[js-jquery-dom]: http://jeffgran.com/2009/06/03/javascript-jquery-vs-the-dom/

---

### Historical

Ya know, I gave this [guest lecture][guest] one time ...

[guest]: http://redlinernotes.com/docs/talks/igl.html

---

### Standalone

Spotify has some [example apps][examples] we can look at, study, and discuss.

(Remember: reading and discussing other people's code is *good* for you!)

* Artist search app: http://jsfiddle.net/JMPerez/0u0v7e1b/

[examples]: https://developer.spotify.com/web-api/code-examples/

---

### Railsified

* [Rails UJS][ujs]. Awesome for simple things!
* We'll talk more about this and [The Asset Pipeline][pipeline]
  and how they interact, probably tomorrow.

[pipeline]: http://guides.rubyonrails.org/asset_pipeline.html
[ujs]: http://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html

---

### Let's Blarg

1. Clean up the form_tag usage.
   Discuss form_for and its dark magics.

2. Discuss strong params. Maybe refactor? 

3. Finally, do some remote: true, js.whatever magic.

---

### Review

3 kinds of Rails security/protection off the top of my head:

* CSRF protection
* SQL Injection prevention (they do their best)
* Strong Params (which was added due to a real security flaw effecting Github!)
