# DTA Client

Crystal Client for Ruby on Rails apps using [devise_token_auth](https://github.com/lynndylanhurley/devise_token_auth)

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     dta_client:
       github: HCLarsen/dta_client
   ```

2. Run `shards install`

## Usage

```crystal
require "dta_client"
```

Start by initializing an instant of DTAClient with the base path for the Devise controller of the target server, and using it to sign in with your credentials.

**Note**: 'base path' refers to the common parts of the path to the Devise routes, including namespaces. For instance, if the sign in path is `www.rails-app.ca/api/v1/auth/sign_in`, then the base path would be `www.rails-app.ca/api/v1/auth`

```crystal
client = DTAClient.new("localhost:3000/api/v1/auth")
```

The sign in method takes care of signing in, and storing the authentication token params needed to access other routes of this app, which can be accessed through the `#auth_params` method.

```crystal
client.sign_in(email: "myemail@example.org", password: "FakePassword123")
client.auth_params  #=> HTTP:Headers{"access-token" => "08Na79ohCtHjDl2MtHEEAQ", "client" => "9eKqFG5UY9f6yLh7TVc8rA", "expiry" => "1627764337", "uid" => "corps@example.com"}
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/HCLarsen/dta_client/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Chris Larsen](https://github.com/HCLarsen) - creator and maintainer
