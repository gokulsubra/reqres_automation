# Use Ubuntu 20.04 as a base image
FROM ubuntu:20.04

# Set the working directory in the container
WORKDIR /app

# Update package lists and install necessary dependencies
RUN apt-get update -y && \
    apt-get install -y \
    build-essential \
    libpq-dev \
    curl \
    gnupg2 \
    ruby-full

# Install Ruby 3.0.0 using RVM
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && \
    \curl -sSL https://get.rvm.io | bash -s stable && \
    source /etc/profile.d/rvm.sh && \
    rvm install 3.0.0 && \
    echo "source /etc/profile.d/rvm.sh" >> /etc/bash.bashrc && \
    echo "rvm use 3.0.0 --default" >> /etc/bash.bashrc

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
