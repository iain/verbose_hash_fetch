# VerboseHashFetch

This gem monkey patches `Hash#fetch` so that KeyErrors show the contents of the
hash in which the key wasn't found.

## Example

We are taught to use `Hash#fetch` instead of `Hash#[]`, so that we don't get
unexpected `nil`s floating around in our code. `Hash#fetch` will raise an
exception when the key isn't found, right where you tried to access it. Rather
fail early then have a nil pop up somewhere else!

But there is one thing that annoys me. Say you're writing this code:

``` ruby
def hello(options)
  name = options.fetch(:name)
  puts "Hello, #{name}!"
end
```

Now, you're calling this method, passing in some params that you got from
somewhere else:

``` ruby
hello(params)
# => key not found: :name (KeyError)
```

Blast! Now I have to see why `params` doesn't have the key `:name` in it. Did I
misspel it somewhere? Was the name parameter a String instead of a Symbol?

What shall I do: put a `puts` in the code? Should I `raise params.inspect`,
should I launch a debugger, or should I stare at the code long enough to
see the mistake?

All these options suck. Just have `verbose_hash_fetch` loaded, and you'll
see the contents of the hash appear in the error itself!

``` ruby
require 'verbose_hash_fetch'

hello(params)
# => key not found: :name in Hash: {:naem=>"Avdi"} (KeyError)
```

No more guessing, no more retrying. See it when it happens!

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'verbose_hash_fetch'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install verbose_hash_fetch
```

## Usage

If you have `verbose_hash_fetch` in your Gemfile, and you're using Rails, then
you don't need to do anything.

If you need to load it manually:

``` ruby
require 'verbose_hash_fetch'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Credits

I was complaining on Twitter, so [Roel van Dijk](http://twitter.com/rdvdijk)
made it and put it in a Gist. I just converted it into a gem.
