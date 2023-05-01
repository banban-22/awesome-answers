# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## generate model
rails generate model question title:string body:text
(creating the db/migrate file and models/question)

### how to check the migrate status
rails db:migrate:status

## to interactive with pry
rails c

## management of the migration
rails db:migrate
rails db:rollback

## add new columns to the existing db
rails generate migration add_<name of the table>
rails generate migration add_view_count_to_questions
rails generate migration add_view_count_to_questions view_count:integer

## remove columns from the db
rails db:rollback
rails generate migration remove_<name of the column>_from_<name of the table>
rails generate migration remove_like_count_from_questions like_count:integer

## DB interactions
* Open the pry
rails c 

* add info one by one
q1 = Question.new
q1.title = 'title'
=> "title"
q1.body = 'body'

q1.persisted?

* save to the database
q1.save

* add info all at once
q2 = Question.create(title:'2nd question', body:'2nd body')

* .all
e.g.) all_questions = Question.all

* .select
same as the select in the SQL
e.g.) Question.select('title')
e.g.) Question.select('*')

rails generate migration add_title_index_to_questions

## CRUD
# Creating the controller
```
rails g controller products
```

## Creating model
```
rails g model answer body:text question:references
```

## Assets
To check the all assets' paths in the app...
```
Rails.application.config.assets.paths
```

Add below to /app/assets/config/manifest.js
```
//= link_tree ../javascript .js
```