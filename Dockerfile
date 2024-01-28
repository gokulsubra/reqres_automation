# Use an official Ruby runtime as a parent image
FROM ruby:3.0.0

# Set the working directory in the container
WORKDIR /app

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install system dependencies for building native extensions
RUN apt-get update && \
    apt-get install -y build-essential libffi-dev

# Install bundle and dependencies
RUN gem install bundler
RUN bundle install

# Copy the entire project directory to the container
COPY . .

# Run Cucumber tests
RUN bundle exec cucumber
