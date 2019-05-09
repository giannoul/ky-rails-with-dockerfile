# ky-rails-with-dockerfile

This repository contains a simple rails 5 application along with the instructions on how to get it deployed in KontainerYard. The tool used is `deis`.

The rails application is using the `development` configuration in order for it to run without the need for external db services.

### Steps for deployment

  1. Create a new application
  2. Set the appropriate configuration variables for our application
  3. Deploy

### Create a new application
The command to use is:
```
deis create igiannoulas-rails-deis
```

### Set the appropriate configuration variables
The command to use is:
```
deis config:set PORT=5000
```
This is the port that our application will use in order to receive the requests that Load Balancer will relay.

### Deploy
Given that you are inside the directory issue:
```
git add .
git commit -m "My first deploy"
git push deis master
```
After the deployment takes place you may check the logs by issuing `deis logs` and the running application information via `deis info`.
