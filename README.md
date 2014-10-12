# HasStreak

Track streaks on your ActiveRecord models.

## Installation

Add this line to your application's Gemfile:

    gem 'has_streak'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install has_streak

## Usage

Let's say I have a <code>User</code> that <code>has_many</code> posts:

```ruby
class User < ActiveRecord::Base
  has_many :posts
end
```

I want to track how many days in a row that each user wrote a post. I just have to add <code>has_streak</code> to the model:

```ruby
class User < ActiveRecord::Base
  # ...

  has_streak
end
```

Now I can display the user's streak:

```ruby
user.streak(:posts) # => number of days in a row that this user wrote a post.
```

The <code>streak</code> instance method can be called with any association:

```ruby
user.streak(:other_association)
```

This gem assumes that the model you want to track has a <code>created_at</code> timestamp.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
