# Url Shortener

# How to setup and install the application

```
git clone git@github.com:gilbertek/shortly.git
```

```ruby
cd shortly
bundle
```

# Reasoning behind any design decisions
This is minimal proof of concept type of application.

Use the light wright Sinatra framework and Postgresql.

Deployable on heroku

# How you came up with the short URL scheme
Using randomize strings 36 to the power of 5

# Future improvements you would make with more time
Add validations

# Bonus Part
- The Bonus section is for those of you with a bit more operations experience.  Given a blank server, how would you set it up from scratch?  Custom bash scripts?  Chef?  Capistrano tasks?
For a quick and durty or a throw away server, I will write a quick bash script. But will resort to Chef or Ansible for a repeatable process.
