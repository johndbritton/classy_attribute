# ClassyAttribute

Give your ActiveRecord attribute some class.

ClassyAttribute provies a simple way to wrap ActiveRecord attributes with feature rich domain objects. It works with `String`, `Numeric`, `Date` and any other Ruby type that can be natively represented in your database.

__Warning__: Consider this code experimental until `v1.0.0` is released.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'classy_attribute'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install classy_attribute

## Usage

Use ClassyAttribute in conjunction with `ActiveRecord#serialize`.

In your model class:

```ruby
class User < ActiveRecord::Base
  serialize :email, Email
end
```

Then, in your attribute class:

```ruby
class Email
  include ClassyAttribute
end
```

Voilà, your attribute is now classy:

```ruby
u = User.new
=> #<User:0x007f99cd755b98 id: nil, email: nil>
u.email = Email.new("email@example.com")
=> #<Email:0x007f99cd77e110 @value="email@example.com">
u.save
(0.2ms)  begin transaction
SQL (0.7ms)  INSERT INTO "users" ("email", "created_at", "updated_at") VALUES (?, ?, ?)  [["email", "email@example.com"], ["created_at", "2015-01-15 04:05:21.939200"], ["updated_at", "2015-01-15 04:05:21.939200"]]
(0.5ms)  commit transaction
=> true  
u.reload
=> #<User:0x007f99cd755b98 id: 1, email: #<Email:0x007f99d2c55c38 @value="email@example.com">...>
u.email.class
=> Email
```
You can compare instances of your attribute class as you'd expect:

```ruby
u.email == Email.new('email@example.com')
=> true
u.email > Email.new('a@example.com')
=> true
```

Access the storage representation by calling `#value` on an instance of your attribute class:

```ruby
u.email.value
=> "email@example.com"
u.email.value.class
=> String
```

Go forth and add useful behavior to your attribute class!

## Contributing

1. Fork it (https://github.com/johndbritton/classy_attribute/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
