# OmniAuth Box.net Strategy

This gem provides a dead simple way to authenticate to Box.net using OmniAuth.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-box'
```

## Usage

First, you will need to [register an application](http://www.box.com/developers/services/new_service_terms) with Box.net and obtain an API key. Once you do that, you can use it like so:

```ruby
use OmniAuth::Builder do
  provider :box, 'yourapikey'
end
```

## Auth Hash Schema

The following information is provided back to you for this provider:

```ruby
{
  uid: '12345',
  info: {
    nickname: 'login', # may be email
    email: 'someone@example.com'
  },
  credentials: {
    token: 'thetoken' # can be used to auth to the API
  },
  extra: { raw_info: raw_api_response }
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
