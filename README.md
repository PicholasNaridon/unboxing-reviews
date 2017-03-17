# README

Authors:

Tim Kanacevic, William Sierra, Nick Paridon

Un-boxed is a Ruby on Rails application for those who are enthusiastic about packaging. Users are presented with a list of recently reviewed unboxing experiences. They can comment on others’ posts or create a review of their own.

Root path is just a landing page where users can sign up, sign in and/or be routed to a list of items. The list of items will show a current list of what’s being talked about. Clicking on a item will take them to a page where they can get information about the item (purchase url, description, image) as well as any video uploads of the unboxing itself. Users can leave reviews as well as up vote and down vote previous reviews

Https://un-boxed.herokuapp.com

* Ruby version
$ 2.3.3
* Database creation
$ rake db:create
* Database initialization
$ rake db:migrate
* How to run the test suite
$ rspec
* Deployment instructions
$ rails s
$ npm start
* ...

![Build Status](https://codeship.com/projects/684b2a40-e63c-0134-6c35-7692759d8180/status?branch=master)
![Code Climate](https://codeclimate.com/github/picholasnaridon/unboxing-reviews.png)
![Coverage Status](https://coveralls.io/repos/picholasnaridon/unboxing-reviews/badge.png)
