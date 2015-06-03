# samplserv / samplparty

## Description

Make a basic sampler / sequencer with Sinatra

This will be our first group project! It is due before class on June the 4th.

## Git Prerequisites

I would recommend you at least skim the following to get some
more background on branching and merging:

Git is a tool that supports various different workflows.
[Understanding Github Flow][understanding-github-flow] will introduce
you to some basic ideas about how we work with branches and merging.

It's a broad overview of a production workflow with branches
and that's what is key for you to understand at this time.

If you want a truly deep dive on how branches and remotes actually *work*
the best resource I know of is the article [Git from the Inside Out][gftio]
by the amazing Mary Rose Cook.

Github Flow is a popular way of using git and there is a more in-depth
discussion of Github Flow [here][github-flow] in case you want more background.

[gftio]: http://maryrosecook.com/blog/post/git-from-the-inside-out
[understanding-github-flow]: https://guides.github.com/introduction/flow/index.html
[github-flow]: http://scottchacon.com/2011/08/31/github-flow.html

## Objectives

### Learning Objectives

After completing this assignment, you should…

* Be able to build an API to expose and trigger song samples on your machine
* Running shell commands from Ruby
* Rock!

### Performance Objectives

After completing this assignment, you be able to effectively use

* Sinatra for taking `POST` requests
* System calls and `afplay` to play songs
* Running commands with `system` and `spawn`

## Details

### Deliverables

Don't fork until tomorrow! Just run:
      `git clone git://github.com/TIY-ATL-ROR-2015-May/samplserv.git`
tonight, run the server, and experiment!

Add new methods, change existing methods, try to write new API bindings
in the client, etc.

The deliverable for *your team* due Thursday morning is:

* A fork of samplserv with modifications to 'samplserv.rb' and 'client.rb'

### Requirements

Server:
* Running `RACK_ENV=production bundle exec ruby lib/samplserv.rb` should
  start a server with endpoints described below

* Running `ruby lib/client.rb` should start the client which will
  play something resembling a song by sending requests to the server! 

### Notes

1. You will need two terminals to do this assignment.
   One to run the client and one to run the server.

2. You can stop the server by typing `Control-C Control-C`.

3. When you make changes to the server, you will need to
   restart the server (but not the client!) for them to take effect.

## Normal Mode

Feel free to download the samples from [here][samples]. They're already
included in the project repo though.

Make an endpoint (API call) for each "phrase",
with query params for multiple versions: e.g.

* `POST /harder`
* `POST /better?v=2`

The `client.rb` script should play several samples
in the style and timing of your choosing.

## Hard Mode

Use `sleep` judiciously to play a reasonable cover with a backtrack
(see `beat.mp3`)

## Nightmare Mode

Build a metronome loop in the server, and make sure requested
samples happen on the next beat.


## Additional Resources

* [Watch this](https://www.youtube.com/watch?v=gAjR4_CbPpQ)
* [samples][samples]

[samples]: http://redlinernotes.com/docs/daft-samples.zip