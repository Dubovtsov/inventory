FROM ruby:3.3.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
RUN gem install bundler
COPY Gemfile* ./
RUN bundle install
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
