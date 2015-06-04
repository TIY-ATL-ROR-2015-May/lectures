# etsiest

___This homework is due before the start of class on Monday, 06/08/15___

## Homework

Re-Create An Etsy Page 

> Specifically, I'm interested in the overall layout. Start by focusing
> on having a header, sidebar, and main content area.
> Then try to style the grid to look as close to the linked etsy page as possible.

> The sidebar should be present but its contents can be whatever you like.
> You don't have to have the various parameters for the search box, etc.

## Deliverables

When you're done, post a link to your code *AND* a screenshot of some results from the app running in your browser. :)
Then close the github issue as usual.

If I run the code with `ETSY_KEY=mySecretKey bundle exec ruby lib/etsiest.rb`,
it should start a sinatra app.

If I go to `localhost:4567/etsy_search?q=whiskey` in my broswer, I should
see a page as close to the [etsy search][esty-search] page as possible.

[etsy-search]: http://www.etsy.com/search?q=whiskey

## Requirements

1. There should be just one route for your app. `get '/etsy_search'` would be acceptable.
2. The controller method should check for a query parameter called "q" and use the Etsy gem to get matching listings.
3. Then render a view using the data from Etsy! Make it look as *close* as possible to the equivalent Etsy search page!
4. Each item should link to its Etsy page.

**NOTES**:
    * Do **NOT** use a CSS Framework such as Twitter Bootstrap or Zerb Foundation or Materialize. We'll do that next week. ;)
    * Worry about the *structure* and *layout* first, then the fine **styling**.
    * You are free to use whatever search term you like in testing. `whiskey` just has some nice results.
    * **The Controller side is NOT the important part of this assignment. Get that done first and just focus on the views.**

### Hard Mode

Make the search form actually link back to *our* etsy_search page with a new query param.
This way you don't have to manually write the URL in the address bar every time. :)

If you do this your controller method shouldn't try to make an API call if no query param is provided.

### Nightmare Mode

Try to implement `hover` events for the items as on the Etsy page.

## Getting Started

Rather than forking an empty project of mine, you're going to make your own this time.
Don't worry. Just follow the steps!

1. `bundle gem etsiest` in your folder for TIY projects.
   This will generate a new project skeleton in an 'etsiest' folder.
2. Add any needed gems to the `Gemfile`. For this project, you'll want "sinatra" and "etsy".
   (You probably also want `pry` in a `:development` group. :)
3. Now commit the basic project skeleton by running `git add .` and `git commit -m 'Basic project skeleton.'`!
4. If you haven't already, create a new repo on github and add the remote / push your copy to github.
5. Get an API token by registering as an [Etsy developer](https://www.etsy.com/developers/).

*Note*: Don't forget to run bundle!

Read the docs for the [etsy gem][etsy-gem], you don't need to write your own API wrapper!
Just sticking to "Public Mode" API calls should be fine, you only need an API key not the crazy OAuth stuff.

## FAQ

1. The Etsy Gem docs are confusing. What friggin API call should I be using?

   Yeah, the API docs for the Gem are a bit confusing. You have two options:

   * `Etsy::Listing.find_all_active_by_category('whiskey', :includes => ['Images', 'Shop'])` but this still returns weird results sometimes.
   * `Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => 'whiskey')` seems to return good results.

   Remember: You have to set your API key first!

2. How do we pass our Etsy API key along?

   I would just run this on the command line as follows:
     `ETSY_KEY=foobarbaz bundle exec ruby lib/etsiest.rb`

   In your "etsiest.rb" file, above your route declarations just have:
      ```
      require 'etsy'
      Etsy.api_key = ENV['ETSY_KEY']
      ```

3. Where do we put our CSS with Sinatra?

   Remember that our erb templates live in a `lib/views` directory.

   Similarly, you may put stylesheets in a `lib/public` directory.

   You can then add it to the `<head>` of your views as follows:
       `<link rel="stylesheet" href="foo.css">`

4. How do we use partials with Sinatra?

   You can do this project without partials but partials will make your life easier when you need to render the search results.

   From the Sinatra docs: [partials][partials]!

   Simply add another file `foo.erb`, place the code you want to be a partial in there. Then call it from the original file as follows:

   `<%= erb :foo %>`

   If you want to local variables to be in scope in the partial, just do:

   `<%= erb :foo, locals: { var_a: 'cookies', var_b: x } %>`

   [partials]: http://www.sinatrarb.com/faq.html#partials

## Resources

1. [Lecture Notes](https://gist.github.com/twhitacre/4eca6690470cd20225e8#file-today-md)
2. [Learn Layout](http://learnlayout.com/)
3. [Etsy Gem Documentation][etsy-gem]
4. [Etsy API Documentation](https://www.etsy.com/developers/documentation/reference/listing)
5. [Etsy JSON Response Example](https://api.etsy.com/v2/listings/active?api_key=h9oq2yf3twf4ziejn10b717i&keywords=whiskey&includes=Images,Shop)
6. [Etsy Page Example](https://www.etsy.com/search?q=whiskey)

[etsy-gem]: https://github.com/kytrinyx/etsy