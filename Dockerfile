# Use an official Ruby runtime as a parent image
FROM ruby:3.0.0

# Set the working directory in the container
WORKDIR /app

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install bundle and dependencies
RUN gem install bundler && bundle install
RUN bundle exec cucumber
