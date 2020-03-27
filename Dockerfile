FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

ENTRYPOINT [ "./wait-for-postgres.sh", "bash", "./entrypoint.sh"]
