# Blockmason Link SDK for Ruby

[![Link SDK][3]][4]

[![Build Status][1]][2]
[![Gem Version][13]][14]

Turn this:

```solidity
pragma solidity ^0.5.10;


contract Widgets {
  struct Widget {
    uint256 id;
    uint32 color;
    string name;
  }

  mapping (uint256 => Widget) private widgets;

  function createWidget(uint256 id, uint32 color, string memory name) public {
    require(widgets[id].id != id);

    widgets[id].id = id;
    widgets[id].color = color;
    widgets[id].name = name;
  }

  function getWidget(uint256 id) public view returns (uint32 color, string memory name) {
    Widget memory widget = widgets[id];
    return (widget.color, widget.name);
  }
}
```

...into this:

```
POST /createWidget
{"id":1,"color":"0x3090f0","name":"anvil"}
# => {}

GET /getWidget?id=1
# => {"color":"0x3090f0","name":"anvil"}
```

Link is a hosted platform for deploying Ethereum smart contracts as conventional web APIs,
instantly taking you from **code** to **production**. No fuss, no orchestration to manage.
Link runs your code, and you use it.

## Getting Started

[Sign up][5] for Blockmason Link. It's free to get started.

Once you're in, you can use the provided demo project to experiment.

Reveal and copy the project's **Client ID** and **Client Secret**, which are both required for *authentication*.

Take a look at your project's **API**, which tells you which API calls are available after authenticating.

## Installing

To add this gem to your app (assuming your app is using [Bundler][6]), add the following line to your Gemfile:

```
gem 'blockmason-link'
```

Alternatively, to install this gem for local experimentation (such as in a Ruby REPL or CLI tools):

```
gem install blockmason-link -P HighSecurity
```

> 💡 The `-P HighSecurity` flag is optional, but recommended. See [RubyGems Security][11] for details.

## Usage

In your app where you intend to use the Link SDK, include the following `require` statement to import the gem:

```ruby
require 'blockmason/link'
```

To get a client for your Link project, create an instance of a `Blockmason::Link::Project`:

```ruby
project = Blockmason::Link::Project.new(client_id: '<client-id>', client_secret: '<client-secret>')
```

> 💡 Inject the `client_id` and `client_secret` any way you wish. We recommend using a live secrets
> store like [Vault][7], or using [environment variables][8].

Once you have a `Project` instance, you can perform `#get()` and `#post()` requests like this:

```ruby
# Sample GET request (based on the default Link project)
project.get('/helloWorld')
# => {"message":"Hello, world!"}
```

```ruby
# Sample POST request
project.post('/createWidget', id: 1, color: 0x3090f0, name: 'anvil')
# => {}
```

For full documentation, see the generated RDoc [API Reference][12].

## Support

❓ Have a question?

🐛 Found a bug?

✨ Have a feature request?

If your question/bug/request is specifically related to the Ruby SDK, then [create an issue][9] in the SDK's GitHub repo.
For everything else, check out the Link product's [support resources][10] which includes an invite to our developers-only
Slack community.

## Contributing

Want to help? Great!

You are more than welcome to contribute to any open [Issues][9] you see.
Anywhere you see room for improvement (code refactoring, testing, documentation, security, etc), let us know,
and if you have the chops and the time, feel free to contribute! Community input and feedback is very valuable
and important to us, and we endeavor to empower contribution and collaboration.

[1]: https://circleci.com/gh/blockmason/link-sdk.ruby.svg?style=svg
[2]: https://circleci.com/gh/blockmason/link-sdk.ruby
[3]: https://mason.link/sdk.png
[4]: https://blockmason.link/
[5]: https://mason.link/
[6]: https://bundler.io/
[7]: https://www.vaultproject.io/
[8]: https://12factor.net/config
[9]: https://github.com/blockmason/link-sdk.ruby/issues
[10]: https://blockmason.link/support
[11]: https://guides.rubygems.org/security/#using-gems
[12]: https://www.rubydoc.info/gems/blockmason-link/Blockmason/Link/Project
[13]: https://img.shields.io/gem/v/blockmason-link
[14]: https://rubygems.org/gems/blockmason-link
