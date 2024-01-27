# Use Ubuntu 20.04 as a base image
FROM ubuntu:20.04

# Set the working directory in the container
WORKDIR /app

# Update package lists and install necessary dependencies
RUN apt-get update -y && \
    apt-get install -y \
    build-essential \
    libpq-dev \
    ruby-full \
    ruby-dev \
    zlib1g-dev

# Install bundler
RUN gem install bundler

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install bundle and dependencies
RUN bundle install

# Copy the entire project directory to the container
COPY . .

# Run Cucumber tests
RUN bundle exec cucumber
