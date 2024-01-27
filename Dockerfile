# Use an official Ruby runtime as a parent image
FROM ruby:3.0.0

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install bundle and dependencies
RUN gem install bundler && bundle install

# Copy the entire project directory to the container
COPY . .

# Run Cucumber tests
RUN bundle exec cucumber
