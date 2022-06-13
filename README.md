# Hl7

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hl7`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add hl7

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install hl7

## Usage

Read an HL7 message

```
# read
content = "MSH|^~\\&#|SENDING|SENDING|SENDING|20100401|0900||ADT^A04|123456789|P|2.3\r"

# parse the content to an HL7:Message
message = HL7.parse(content)

# read the message configuration
message.config.field_separator # => |
message.config.component_separator # => ^

# read segments
message.segments.size # => 1

# read segments name
message.segments.first.name # => 'MSH'

# get an specific segment
message.get('MSH') # => HL7::MSH


```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hl7. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hl7/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Hl7 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hl7/blob/master/CODE_OF_CONDUCT.md).
