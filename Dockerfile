FROM ruby:2.4.1

ENV HOME_DIR /app

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main 9.5" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get install -y libpq-dev postgresql-client-9.5

RUN mkdir -p $HOME_DIR
WORKDIR $HOME_DIR

COPY ./Gemfile* $HOME_DIR/
RUN bundle install --deployment

COPY . $HOME_DIR

CMD rackup -o 0.0.0.0 -p $port
