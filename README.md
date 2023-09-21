# README

## How to run this application: 

1- Navigate to the top-level directory. 

2- Run `bundle install` to install all libraries and packages 

3- Run `rails db:migrate:reset db:seed` to set up the database and initialize users

4- Run `rails s` to begin the application 

## Making API Calls 

This app authorizes API requests through checking the username, which it expects to be sent as a URL param called "self". 

There are 3 users available to use: 'user1', 'user2', and 'user3'. 

## To-Dos/Next Steps 

1- Use headers or token for authorization 

2- Remove security checks from each individual method and include as a "before_action" check in the controller 

3- Implement more robust and informative error messaging 
