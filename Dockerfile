# Base image
FROM ruby:3.2.3
USER root

# Set environment variables
ENV RAILS_ENV=development
ENV NODE_ENV=development

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  curl \
  nodejs \
  postgresql-client \
  build-essential

# Install Yarn and Webpack dependencies
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install yarn -y

# Set working directory
WORKDIR /myapp

# Copy Gemfile and Gemfile.lock
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . /myapp

# Install JavaScript dependencies
RUN yarn install

# Compile assets
RUN bundle exec rails webpacker:compile

# Expose the port on which the app will run
EXPOSE 3000

# Start the server and create the database
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bin/rails db:create db:migrate && bundle exec rails s -b '0.0.0.0'"]
