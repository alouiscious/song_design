# App Dev Process

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    Ruby 2.6.0  

* System dependencies
  gems:
    faker
    
    omniauth
    for devise
      bcrypt ~> 3.0
      orm_adapter ~> 0.1
      railties >= 4.1.0
      responders >= 0
      warden ~> 1.2.3

     
* Configuration
  rails new app used for Song Design app
  rails g resource utilized for MVC and migration files creation.
  model modifications include has_many, many_to_many, strftime formating, validations, optionals, partials, view helpers, and scope.

* Database creation
  besides the rails generator user to create the intital migration table, a seeds file and faker gem was utilized to create smple database content


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)
  Counter caches set for songs, users, songnotes.
  rt.

  Rails authentication useing the Devise gem.
  Configuration :
    Add config for action mailer in the config/development
  Database: devise generator creates a migration for the app's users (your auth account's) table.
  M-V-C:
  Models: Devise generator creates its model. use it to choose the authentication features of choice.
  Views: Devise generator create its folder of views. These can be customized and stylesheet
  Controllers: Devise used the gem to define its controllers. As a Rails engine, Devise runs as an app inside the app. It use the model layer to hook into the mother app.

  Routes: Use a helper that devise gives us to mount the routes within config/routes.rd (devise_for :users)

there are two destroy user session commands in the routes.rb and the applicationmhtml.erb layout. i commented out the routes command. does the routes.rb one control a destroy command for github auth, and the application.html control the destroy command for devise???
* Deployment instructions

* ...
