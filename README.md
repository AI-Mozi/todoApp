# Todo Application

A simple todo application for desktop only. </br>

https://mozi-todo.herokuapp.com/

### Ruby version
  * 2.7.1
### System dependencies
  * PostgresSQL
### Installation
  * Clone project using Git </br>
  * Run `bundle install` </br>
  * Configure database </br>
    - Create the DB user by running command: </br>
      ```
      sudo -u postgres psql -c "CREATE USER username WITH CREATEDB NOCREATEROLE PASSWORD 'password'"
      ```
    
    - Create .env file and add password and username there. Add .env to your .gitignore <br>
      ```
       AW_DB_PASSWORD=password
       AW_DB_USERNAME=username
      ```
  * Run command `bin/rails db:setup` to create database with seed data. 
  * Start server: `bin/rails s`
  * Navigate in browser to: http://localhost:3000/
