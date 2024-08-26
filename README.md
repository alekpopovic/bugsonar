# bugsonar-ruby

[![Gem Version](https://badge.fury.io/rb/bugsonar.svg)](https://badge.fury.io/rb/bugsonar)

## Error monitoring & exception reporter for Ruby

## Installation

Add gem to the application's Gemfile by executing:

```sh
gem 'bugsonar'
```

Setup bugsonar gem by executing:

If you using rails:

```sh
rails g bugsonar:install
```

Or create config file bugsonar.rb

## Usage

```sh
Bugsonar.configure do |config|
  config.api_key = "YOUR_PROJECT_API_KEY"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bugsonar/bugsonar_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/bugsonar/bugsonar_ruby/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://github.com/bugsonar/bugsonar_ruby/blob/main/LICENSE.txt).

## Code of Conduct

Everyone interacting in the bugsonar project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/bugsonar/bugsonar_ruby/blob/main/CODE_OF_CONDUCT.md).
