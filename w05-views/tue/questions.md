# harder-better

## Description

Make a basic sampler / sequencer with Sinatra

This will be our first group project! It is due before class on June the 4th.

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