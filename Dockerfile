FROM ruby:2.7.5

RUN apt-get update -qq && apt-get install -y yarn nodejs postgresql-client


# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Set timezone
RUN echo "Europe/Rome" > /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

# Prepare application folder
RUN mkdir /app

# Set current directory
WORKDIR /app

# Copy only Gemfile and Gemfile.lock to application folder
COPY Gemfile* /app/

RUN bundle install

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]