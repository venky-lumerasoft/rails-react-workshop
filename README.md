# rails-react-workshop

This repository contains the docker files for a skeleton web application
which uses the following:

## Backend
1. Ruby on Rails framework
1. Rails version 6
1. Postgres
1. Devise gem for managing users

## To build and run the application
1. Switch to the `rails` folder and run 
   
   `docker-compose build`

1. From within the `rails` folder, run 
   
   `docker-compose up`
   
1. For the initial setup, create the application's database in postgres container using the following command:

   `docker-compose run web rake db:create`

1. Access the rails application using the following url.

   `http://localhost:4000`
