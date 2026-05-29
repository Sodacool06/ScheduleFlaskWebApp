FROM ruby:2.7

RUN apt-get update && apt-get install -y \
    git build-essential sqlite3 libsqlite3-dev

WORKDIR /app

RUN git clone https://github.com/beefproject/beef.git .

RUN bundle install

EXPOSE 3000

CMD ["./beef"]
