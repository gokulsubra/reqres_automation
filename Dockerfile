# Use an official Ruby runtime as a parent image
FROM ruby:3.0.0



# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install bundle and dependencies
RUN gem install bundler && bundle install



# Run Cucumber tests
RUN bundle exec cucumber
