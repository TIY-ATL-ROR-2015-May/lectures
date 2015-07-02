### The Last Lecture?

--

Not sure if:

![disappoint](http://mashable.com/wp-content/uploads/2013/07/Dr.-Who.gif)

---

### The Last Lecture?

OR

--

![awesome](https://33.media.tumblr.com/474bb51f05a33360d70f18cbde9fd18c/tumblr_mlr7aiP4OF1r4aiyzo1_500.gif)

---

### Now Improv!

Three things to cover:

1. Why form_for and Strong Params are common in Rails apps and *good*.
2. Why background jobs with Resque are awesome if slightly complicated.
3. Why Resque on Heroku is actually complicated and a pain in the ass.

---

### New Rails Ish!

#### `form_for`
  `form_for` is great when we're actually trying to edit a *model*.
   Groups form parameters into a hash, better naming of input ids,
   and it prepopulates fields if the model already has been saved/has data.

   The tricky part of `form_for` is that it *must* be able to autogenerate
   the action and HTTP verb of the form _for us_. So we pass it a model or
   array of models and it is crucial that calling `url_for([@model1, @model2])`
   on those models gives us the right route. Otherwise, `form_for` won't know
   what to do.

--

#### Virtual Attributes

   Virtual attributes are also a neat trick we can use on our models.
   If we want to work with an association for a model in a simple way,
   it may be more convenient to define special getter and setter methods
   for working with it than to use the associations directly.

   For a good example, see [this commit][virtual-attr] from blarg,
   which allows us to just use `tag_names` in the form for a post
   and remove the tag management cruft from the posts_controller.

[virtual-attr]: https://github.com/TIY-ATL-ROR-2015-May/blarg/commit/3441983c13896a5638f7cf0a19a47be236854a2a

---

### One More Rails-ism

#### Strong Params

   [Strong Parameters][strong-params] prevent us from a kind of
   security flaw called the "Mass Assignment Vulnerability".
   Mass Assignment refers to the fact that we can simply call
   `Post.create(hash)` passing a hash of attributes to create a
   post. This is obviously incredibly convenient.

--

   However, it doesn't take into account whether or not the user is
   allowed to edit the attributes in question. I.e. A hacker could
   craft a POST request by hand to the "Edit User" endpoint that
   passes "admin: true" as a parameter. If our model has an admin
   column and we naively do `@user.update(params)` or similar
   then anyone could use this trick to make themselves an admin.

--

   This actually happened to [Github][github-sec], among others.
   As a result, Rails added Strong Params in Rails 4.1 which
   requires us to define which params are allowed to be edited in
   the controller. See more [here][strong-params].

--

   **NOTE:** Just a reminder, Strong Params are only necessary when
   we are doing "mass assignment". I.e. When we are passing a hash
   directly to `Foo.new` or `Foo.create`.

[strong-params]: http://edgeguides.rubyonrails.org/action_controller_overview.html#strong-parameters
[github-sec]: https://github.com/blog/1068-public-key-security-vulnerability-and-mitigation
