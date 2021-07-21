# FindHotel - [Heroku](http://localhost:4000/api/geolocation/200.106.141.15)

To start your Phoenix server:

Database Setup:
  * Install [postgresql](https://www.postgresql.org/download/)
  * Login to postgres `sudo -u postgres psql`
  * Create a sample database `create database geo_location_dev;`
  * Create user dummy_user `create user dummy_user with encrypted password '123';`
  * Grant all previleges to the user `grant all privileges on database geo_location_dev to dummy_user;`

Server Setup:
  * Install [elixiri 1.12.0](https://elixir-lang.org/install.html).
  * Clone this repo `git clone https://github.com/pavancse17/find_hotel.git`
  * Move to root directory `cd find_hotel`
  * Install dependencies with `mix deps.get`
  * Create `.env` file at root directory. Paste content from .env.sample file and replace with actual credentials.
  * Source the environment variables `source .env`.
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Dumping the data using Importer Interface:
  * Download the [sample](https://drive.google.com/file/d/1EaQTWa5d4-426-WH-SlZCSuXhBCZv9go/view?usp=sharing) CSV file and place it in the root directory.
  * Open the terminal and bring up the elixir cli `iex -S mix`
  * Now use the CSVImporter to import data from CSV to database `FindHotel.GeolocationService.CSVImporter.import("./data_dump.csv")`.
  * It will take aroung 40 minutes to dump 1000000 records to database.

Using API:
  * Once we start the server with `mix phx.server`, navigate to `http://localhost:4000/api/geolocation/${ip_address}`
  
        Example: http://localhost:4000/api/geolocation/200.106.141.15


Tradeoffs:
  * There is one particular tradeoff I couldn't focused due to time constraint. In CSVImporter module, right now I am inserting records one by one to db. I thought of doing bulk insert but there is catch in this approach, All the validations we can perform except the duplicate ip address since it is database level constraint. If we avoid unique constraint validation we can perform chuck by chunk bulk inserts which in return reduces the overall time taken with lesser queries.
  * Regarding test cases also I didnt get a chance to write test cases for all the code. but I have tested manually while developing as much i can.


High level technical decision:
  * I used Ecto to model, validate and query the data.
  * Created two modules:
     - `FindHotel.GeolocationService.CSVImporter` to insert data.
     - `FindHotel.GeolocationService` to query the data.
  * I used Phoenix web framework in order to host the web server with the API.

Time spent on this task:
  * I spent around 3 hours for the core requirements.
  * After long time I am visiting the Heroku again for this project to host. So it took some time to me.