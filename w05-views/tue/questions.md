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

* A repo containing at least:
  * `daft.rb`
  * `rock.rb`

### Requirements

* Running `daft.rb` should start a server with endpoints described below
* Running `rock.rb` should make requests to that server to play a "song"


## Normal Mode

Download the samples from [here][samples]. Make an endpoint (API call)
         for each family, with query params for multiple versions: e.g.

* `POST /harder`
* `POST /better?v=2`

The `rock.rb` script should play several samples in the style and timing of your choosing.

## Hard Mode

Use `sleep` judiciously to play a reasonable cover with a backtrack (see `beat.mp3`)

## Nightmare Mode

Build a metronome loop in the server, and make sure triggered samples happen on the next beat.


## Additional Resources

* [Watch this](https://www.youtube.com/watch?v=gAjR4_CbPpQ)
* [samples][samples]

[samples]: http://redlinernotes.com/docs/daft-samples.zip