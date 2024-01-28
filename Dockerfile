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
    gnupg2

# Import GPG key for RVM
RUN gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# Install RVM
RUN \curl -sSL https://get.rvm.io | bash -s stable

# Install Ruby 3.0.0 using RVM
RUN /bin/bash -l -c "rvm install ruby-3.0.0"

# Install bundler
RUN /bin/bash -l -c "gem install bundler"

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install bundle and dependencies
RUN /bin/bash -l -c "bundle install"

# Copy the entire project directory to the container
COPY . .

# Run Cucumber tests
RUN /bin/bash -l -c "bundle exec cucumber"
