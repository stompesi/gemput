# Gemput

The easiest way to manage your Gemfile. Gemput keeps your software stable by freezing Gemfile.

##[Why do you specify gem version?](http://everydayrails.com/2012/09/11/bundler-rails-specify-versions.html)

> The Rails ecosystem moves quickly–too quickly, some might say–and as a result a given library’s API from just a few months ago may be deprecated today–or worse, it may just no longer work. Running bundle install with the Gemfile as-is, I could get gem versions that are no longer compatible with a legacy version of Rails. Or potentially worse, I could get gem versions with drastically rewritten APIsvery difficult to debug without a solid suite of tests. (The codebase in question lacks test coverage, too, but that’s a different subject.)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gemput'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gemput

## Getting Started

Add a gem along with its latest gem version in the Gemfile.

```bash
$ gemput add GEM_NAME
$ gemput a GEM_NAME
$ gemput -a GEM_NAME
```

Fill out the missing gem versions in the Gemfile.

```bash
$ gemput sync
$ gemput s
$ gemput -s
```

View command helps.
```bash
$ gemput help
$ gemput h
$ gemput -h
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gemput/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
