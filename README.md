# Nigilist

[![Gem Version](https://badge.fury.io/rb/nigilist.svg)](https://rubygems.org/gems/nigilist)
[![Build Status](https://travis-ci.org/aishek/nihilist.svg?branch=master)](https://travis-ci.org/aishek/nihilist)
[![Code Climate](https://codeclimate.com/github/aishek/nihilist.svg)](https://codeclimate.com/github/aishek/nihilist)


Nigilist is extremely useful for implement Null Object pattern. It allows null object to return `false` for all question-methods, `nil` for all non-bang-methods, `[]` for all methods in plural form without defining them.

## Installation

```bash
gem install nigilist
```

## Usage

```ruby
class Guest
  include Nigilist

  def polite?
    true
  end

  def locale
    'ru'.freeze
  end
end

current_user = Guest.new
current_user.admin? # false
current_user.polite? # true
current_user.address # nil
current_user.locale # 'ru'
current_user.planets # []
```

### Explanation of Null Object pattern

For example, you have a `User` model, with `#admin?` method, and `Guest` model allows you use same interface for both authorized and unauthorized users like so:

```ruby
class Guest
  def admin?
    false
  end
end

current_user = current_session.user || Guest.new
current_user.admin?
```

So when your project grow and other methods got it place inside `User` model you have to define same methods in `Guest` model which contains no logic but only return `false` or `nil`. In that case Nigilist could be helpful.

## License

Nigilist is free software, and may be redistributed under the terms specified in the LICENSE.txt file.

## Credits

Gem nigilist is maintained by [Cifronomika](https://cifronomika.com/).

Contributors:

* [Alexandr Borisov](https://github.com/aishek)
* [Ivan Nemytchenko](https://github.com/inem)

## The gem about one method

The gem contains exactly one module with one method defined: `method_missing`. I'm sure you able to implement it by yourself in couple of minutes. So feel free just to copy it from `lib/nihilist.rb` 😉
