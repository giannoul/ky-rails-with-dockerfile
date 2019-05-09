# ky-rails-with-dockerfile: filebeat branch

This branch introduces `filebeat` for log shipping. The installation is straightforward and the strarting is just the command running in background. It is mostly a proof of concept in order to not loose this configuration ;)
In this branch we need the parameter `RAILS_LOG_TO_STDOUT` disabled so that the logs are written and shipped. Also, keep in mind that the logs here are in JSON format using the gem `lograge` and the appropriate rails configuration in files:

- config/logging.rb
- config/application.rb

Oh, and a last thing: rake taks don't work.
