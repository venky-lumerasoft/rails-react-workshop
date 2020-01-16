FROM ruby:2.7
RUN apt-get update -qq &&\
    apt-get -y install curl &&\
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_13.x | bash - &&\
    apt-get update -qq &&\
    apt-get -y install build-essential nodejs yarn postgresql-client &&\
    ln -s /usr/bin/nodejs /usr/local/bin/node

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
ENV BUNDLER_VERSION='2.1.2'
RUN gem install bundler --no-document -v '2.1.2'
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 4000

# Start the main process.
CMD ["RUBYOPT='-W:no-deprecated -W:no-experimental'", "rails", "server", "-b", "0.0.0.0"]
