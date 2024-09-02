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
cp config/database.yml.sample config/database.yml
```

##### 3. Run docker project

Run the following commands to create and setup the database.

```ruby
docker-compose up --build
```

##### 4. Run Rspec Testing

You can start the rails server using the command given below.

```ruby
docker-compose --profile test run --rm rspec
```

And now you can visit the site with the URL http://localhost:3000