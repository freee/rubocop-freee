# Rubocop freee

This repository provides recommended Rubocop configuration and additional cops for use on internal Ruby Projects.

## Requirements

- Ruby: 2.3 or higher

## Installation

app/Gemfile
```ruby
group :test, :development do
  gem 'rubocop-freee', require: false
end
```

```bash
$ bundle install --path vendor/bundle
$ git submodule add git@github.com:bbatsov/rubocop.git vendor/rubocop
```

app/.rubocop.yml
```yml
inherit_gem:
  rubocop-freee:
    - config/default.yml
    - config/rspec.yml
    - config/rails.yml
```

## How to add the custom cop.

- Add new cop file

### Add new cop rule into `app/config/default.yml` .

example
```yml
Freee/ScopeReturnValue:
  Description: Check if a scope returns `self` .
  Enabled: true
```

### requires the new cop in `lib/rubocop-freee.rb` .

```ruby
require 'rubocop/cop/freee/scope_return_value'
```

