# Fear::Rspec

`fear-rspec` is a set of rspec matchers for [Fear](https://github.com/bolshakov/fear).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fear-rspec'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fear-rspec

## Usage

Load matchers:

```ruby
require 'fear/rspec'
```

### Either matchers

To match against a `Left`, use `be_left_of` matcher.

```ruby
expect(5).not_to    be_left_of(5) # passes
expect(Left(5)).to  be_left_of(5) # passes
expect(Left(1)).to  be_left_of(5) # fails
expect(Right(5)).to be_left_of(5) # fails
```

To match against a `Right`, use `be_right_of` matcher.

```ruby
expect(5).not_to    be_right_of(5) # passes
expect(Right(5)).to be_right_of(5) # passes
expect(Right(1)).to be_right_of(5) # fails
expect(Left(5)).to  be_right_of(5) # fails
```

### Option matchers

To match against a `Some`, use `be_some_of` matcher.

```ruby
expect(5).not_to   be_some_of(5)  # passes
expect(Some(5)).to be_some_of(5)  # passes
expect(Some(1)).to be_some_of(5)  # fails
expect(None()).to  be_some_of(5)  # fails
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/bolshakov/fear-rspec/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

