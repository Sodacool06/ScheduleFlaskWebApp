FROM ruby:2.7

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    sqlite3 \
    libsqlite3-dev \
    nodejs \
    npm \
    curl \
    gcc \
    make \
    libc6-dev

WORKDIR /app

RUN git clone https://github.com/beefproject/beef.git .

RUN gem install bundler -v 2.4.22

RUN bundle config set without development test

RUN bundle install

EXPOSE 3000

CMD ["ruby", "beef"]
