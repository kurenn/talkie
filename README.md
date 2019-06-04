# Talkie

 [![Build Status](https://travis-ci.org/kurenn/talkie.svg?branch=master)](https://travis-ci.org/kurenn/talkie)
[![Test Coverage](https://api.codeclimate.com/v1/badges/a9148bef84de0a1f97ad/test_coverage)](https://codeclimate.com/github/kurenn/talkie/test_coverage)
<a href="https://codeclimate.com/github/kurenn/talkie/maintainability"><img src="https://api.codeclimate.com/v1/badges/a9148bef84de0a1f97ad/maintainability" /></a>

Talkie is highly customizable comments engine to easily integrate threads to any existing model, inspired by [commontator](https://github.com/lml/commontator) and with simplicity as the drive for this. Its intention is to be a full solution for your application in case you need to provide your users with the ability to open a forum anywhere.

- [Talkie](#talkie)
  - [Installation](#installation)
  - [Usage](#usage)
    - [Customization](#customization)
      - [Styles](#styles)
  - [Development](#development)
  - [Contributing](#contributing)
  - [License](#license)
  - [Code of Conduct](#code-of-conduct)

## Installation

Talkie works with Rails 5.0 onwards. The first step is to add it to your `Gemfile`:

```ruby
gem "talkie"
```

And then run the `bundle install`.

Next, you need to run the install generator:

```console
$ rails generate talkie:install
```

At this point, a thanks message will appear in the console. **Be aware that you need to have a current_user method with the logged in user, there is no guest support currently**

The generator will install an initializer which describes ALL Talkie's configuration options. It is highly recommended that you take a look at it. Also notice that a new migration is provided, you need to migrate your database:

```console
$ rails db:migrate
```

## Usage

After running the generator, you need to set up the models you need to add comments to and the ones who are able to post them.

1. For the models to be able to comment to:

```ruby
acts_as_commentable
```

2. For the models to be able to create comments(commonly the `User` model):

```ruby
acts_as_talker
```

After that you just need to call the helper to render the comments thread. So let's say you have an `Article` model on which you desire to add this:

**app/views/articles/show.html.erb**

```erb
<%= talkie_on @article %>
```

For more options on how to customize the render of the comments, check out the [customization](#customization) section.

After this, you need to add the default styles and JS provided by the gem, just add them to the corresponding manifests like so:

**app/assets/stylesheets/application.scss**

```css
@import "talkie/application";
```

**app/assets/javascripts/application.js**

```js
//= require talkie/application
```

### Customization

Talkie, currently only offers 3 options for the `talkie_on` helper method:

| Name                                                         | Description                                                  |
| ------------------------------------------------------------ | :----------------------------------------------------------- |
| **nested**                                                   | Whether users are able to reply to comments or not. *Default: false* |
| **display_user_avatar**                                      | Whether the helper should render an avatar. *Default: true* |
| **display_user_handler**                                     | Whether the helper should render the user handler. *Default: false* |

Don't worry about those nasty N+1 queries, Talkie is smart enough to take care of them. You don't need to restart the server for chanes on this invokation.

There is another way to customize Talkie, and that is at the `initializer` provided by the install generator, you can check that [here](lib/generators/talkie/templates/talkie.rb)

#### Styles

Talkie is all about customization, so almost every default style provided by the gem can be overwritten through sass variables, which you can find [here](https://github.com/kurenn/talkie/blob/master/app/assets/stylesheets/talkie/_variables.scss). Make sure you add the variables right before importing the sass talkie manifest:

```css
@import "my_variables_to_override";
@import "talkie/application";
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kurenn/talkie. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Talkie project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kurenn/talkie/blob/master/CODE_OF_CONDUCT.md).
