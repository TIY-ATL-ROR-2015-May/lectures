New Stuff we learned today:

1. If we add `gemspec` to our Gemfile, then we
   don't need to mess with the `$LOAD_PATH` to be
   able to require our code!
   What you do is call `bundle exec ruby blah.rb`
   instead of `ruby lib/blah.rb`.

2. Run shell commands from Ruby! (HOLY SHIT)
   Two different ways:
   1. `system("ls")` and that returns true or false.
      And importantly, it's a "blocking call" which
      means ruby waits for the shell command to finish.
   2. `spawn("ls")` and that returns the id of the new
      process that is created. And that is "non-blocking"
      which means ruby doesn't wait for the command to
      finish.
   3. I mentioned that we can know a process id
      we can force quit that program as follows:
      `system("kill #{pid}")`
   4. Finally, we can get a list of currently processing
      from the command line by running `ps`.

      **ADDITIONAL NOTE**: Saw that `afplay` plays audio
                           files on the Mac OS X command line.
                           Also, spawn and system are
                           documented at various places in
                           Ruby Doc.

3. We saw that we can save data in a `settings` object
   available to all the routes defined by Sinatra.
   We do that by writing `set :library, Songs.new(song_path)`.
   We can then access that data with: `settings.library`.

   We also saw that we can create so called "Modular" Sinatra
   apps but you might not necessarily want to. Wasn't that great.

4. We were reminded that you can get your IP address by running
   `ifconfig` and looking for the `inet` part of the `en0` entry
   and that we can make a server visible to others by setting
   `RACK_ENV=production`.

5. Saw exceptions with `begin` / `rescue` for the first time.
   ... But we'll see those more with Rails next week and they
   aren't needed for the homework!

6. We saw that if the client makes a request with a querystring
   (aka Query parameters) that we can look those up from the
   controller by looking in the `params` hash.
   I.e. `params['name']` looks for a query parameter `?name=foo`