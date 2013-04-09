# HashieWalker

[![Build Status](https://secure.travis-ci.org/monterail/hashie_walker.png)](http://travis-ci.org/monterail/hashie_walker)

`Hash`-version of `Array#map` that is recursive and works on keys and values simultaneously.

## Installation

Add this line to your application's Gemfile:

    gem 'hashie_walker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hashie_walker

## Usage

`HashieWalker` walks through object and transforms keys and values along the way.

    object = { "One" => 1, "Two" => 2 }

    HashieWalker.walk(object) do |map|
      map.key { |key| key.downcase }
      map.value { |value| value * value }
    end
    # => { "one" => 1, "two" => 4 }

Object can be a `Hash`, `Array` or nested structure (e.g. an array of nested hashes with arrays as values). See specs for more examples.

If you want to change only keys or values simply provide only a respective mapping function.

    HashieWalker.walk(object) do |map|
      map.key { |key| key.downcase }
    end
    # => { "one" => 1, "two" => 2 }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
