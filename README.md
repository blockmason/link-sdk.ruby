# Blockmason Link SDK for Ruby

[![Link SDK][3]][4]

[![CircleCI][1]][2]

## Installing

To add this library to your app:

```
gem install blockmason-link
```

## Usage

```
require 'blockmason/link'

# Initialize the project
project = Blockmason::Link::Project.new(client_id: '<client-id>', client_secret: '<client-secret>')

# Sample GET request (based on the default Link project)
outputs = project.get('/helloWorld')

# (outputs are provided as a plain object hash)
puts outputs["message"]

# Sample POST request
project.post('/postComment', message: 'Hello, world!')
```

[1]: https://circleci.com/gh/blockmason/link-sdk.ruby.svg?style=svg
[2]: https://circleci.com/gh/blockmason/link-sdk.ruby
[3]: https://mason.link/sdk.png
[4]: https://blockmason.link/
