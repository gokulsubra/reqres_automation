FROM ruby:3.0.0

RUN apt-get update && \
    apt-get install -y build-essential libffi-dev

# Set the working directory in the container
WORKDIR /app

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install bundle and dependencies
RUN gem install bundler && bundle install

# Copy the entire project directory to the container
COPY . /app

# Run Cucumber tests
RUN bundle exec cucumber
