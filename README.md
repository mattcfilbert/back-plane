# README

* Ruby version 2.5~

* Configuration for local testing:

run the following in the terminal from the top level of this repo:
rails db:create (makes your dev and test dbs)
rails db:migrate (runs migrations to create structure)

(if you encounter issues with the db after spooling this up, you can delete the schema, test.sqlite and development.sqlite from the db folder)

(I haven't made any seeds so no need to worry about running rails db:seed)

then run the following in the top level of the repo to spool up the BE:
rails s

should be on your localhost:3000

once you have posted stuff (like a part, for instance), you can view said stuff by going to the relevant route (like localhost:3000/parts or /parts/1 or /parts/1/work_orders)

you can see all routes by looking at the routes file or running the following command in the top level of the repo:
rails routes


* How to run the test suite: 
bundle exec rspec (woefully incomplete)

* 

* Deployment instructions:
good luck!

* ...
