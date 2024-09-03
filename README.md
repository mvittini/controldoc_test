##### Prerequisites

The setups steps expect following tools installed on the system.


- Ruby [3.2.3]
- Rails [7.2.1]

##### 1. Check out the repository

```bash
git clone git@github.com:mvittini/controldoc_test.git
```

##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample.sample config/database.yml.sample
```
##### 3. Create .env file

Copy the example .env file and edit the enviroment configuration as required.

```bash
cp example.env .env
```

##### 4. Run docker project

Run the following commands to create and setup the database.

```ruby
docker-compose up --build
```

##### 5. Run Rspec Testing

You can start the rails server using the command given below.

```ruby
docker-compose --profile test run --rm rspec
```

##### 6. Run Seeds

You can run seed to populate Vehicles and Waypoints

```ruby
docker-compose run web bundle exec rake db:seed_vehicles_and_waypoints
```

And now you can visit the site with the URL http://localhost:3000