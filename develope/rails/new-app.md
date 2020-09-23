# App without JS

> This method reduce the pause of each execute `rails` in the console

## Create without webpack
```bash
rails new "railstestapp3" \
    —skip-webpack-install  \
    —skip-action-mailer     \
    —skip-action-mailbox     \
    —skip-active-storage
```

One line
```bash
rails new "railstestapp3" —skip-webpack-install —skip-action-mailer —skip-action-mailbox —skip-active-storage
```

## Modify file `config/environments/development.rb`
```ruby
config.webpacker.check_yarn_integrity = false
```

## Gemfile
Comment line
```ruby
# gem 'webpacker', '~> 4.0'
```
