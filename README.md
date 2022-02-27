# wanderlust-code-exercise

## How to run
* Go on and clone this repo.
* Make sure you're on Ruby `3.0.3` (the latest stable version available via rbenv when I started this project).
* `bundle install` the dependencies.
* Optionally add your own input in input/data.txt
* From the root of the project, run `ruby src/entry.rb`. Interact with the prompt, and enjoy your sorted data.

## Constraints

I noticed that the vehicle length—while always given in feet—is represented in different ways. E.g. `32 ft` vs `32 '`.
To keep sorting simple, I assumed that while the format might vary, vehicle measurements would always be given in feet.
In real life, I would probably be more inclined to backfill the data and fix it, as opposed to accommodating inconsistencies
in formatting.

## Modeling
I understand that the obvious path forward is probably to include `Customer` and `Vehicle` models. However, after quite a bit of thought, I decided to not do that and just included a model for a row of data—a `Data::Row`.

There's a fair bit of nuance behind that decision, which I would be interested in discussing in more detail. We'll keep it light in this readme and I'll just give you a high level overview of why I took this path.

* There are only two calls we need to perform using our data: `sort` and `write`. Neither a `Customer` or `Vehicle` object
  were more convenient for those operations.
* I didn't feel comfortable assuming that there'd always be a one-to-one relationship between customers and vehicles. If we allowed a one-to-many or even a many-to-many relationship to exist, we'd need to massage `Customer` and `Vehicle` back into what we're currently calling a `Data::Row`. Alternatively, we could create a bi-directional relationship between `Customer` and `Vehicle` in order to make sorting easier, but there are some real hang ups that come along with that.

In short, the `Customer` and `Vehicle` model only serve to nest our data and make sorting more difficult. If we were leveraging them for additional functionality, I'd feel differently.

Once more, because I know this might seem like an unorthodox decision, I'm very open to chatting through it.

## Service layer

Most of the services wrap libraries that Ruby offers. I did this for a few reasons:
* I can more easily stub my own dependencies
* If something about a Ruby library's interface changes, we'd only need to update one spot—the service. No other calls in the code would need to be updated. Across a large code base, this is a big value add.
* Occasionally I needed to bolt little bits of logic on top of the Ruby libraries.

## Room for improvement

There are some edges to this app that I think could be sanded down.

**Sorting** - Right now, the data is just sorted in ascending order by just blindly calling Ruby's `Array#sort`. I think that it'd be easy to justify adding the ability to sort in descending order, or even by a second field.

**Testing** - If you check out `spec/acceptance`, you'll see some end to end tests. I stubbed out my console input service, largely because accepting console input in a test was proving to be more trouble than it's worth. I recognize that it would have earned me some style points, but the ROI here felt low.

Additionally, making my factories a little more robust by using `faker` might've been a nice play.