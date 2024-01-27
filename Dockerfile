# Use an official Ruby runtime as a parent image
FROM ruby:3.0.0

# Set the working directory in the container
WORKDIR /app

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install bundle and dependencies
RUN gem install bundler && bundle install
<<<<<<< HEAD
RUN bundle exec cucumber


=======

# Copy the current directory contents into the container at /app
COPY . /app

# Expose port 3000 to the outside world
EXPOSE 3000

# Command to run the application
CMD ["rails", "server", "-b", "0.0.0.0"]
>>>>>>> 491ef0e789eeaccf8d461a3ac4741925582d8bd6
