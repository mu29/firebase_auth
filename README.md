# FirebaseAuth

Verify & decode Firebase ID token on Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'firebase_auth'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install firebase_auth

## Usage

This library has only one method - `FirebaseAuth::Auth.very_id_token`. This method decodes the id token from Firebase.

```ruby
token = request.headers[:authorization].sub(/^Bearer /, '')

info = FirebaseAuth::Auth.verify_id_token(token)

# info.user_id, info.email, info.name, info.picture ...
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mu29/firebase_auth.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
