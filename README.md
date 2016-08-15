# ValidatorIE

Gem to validation IE from factories in Brazil

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'validator_ie'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validator_ie

## Usage
```ruby
result = ValidatorIE::valid?('XXXXXXXXXXXX','AC') # Only numbers
unless result
  puts ValidatorIE::errors.full_messages
end
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rmomogi/validator_ie. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

