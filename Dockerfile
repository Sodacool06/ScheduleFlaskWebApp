FROM ruby:3.1

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
    libc6-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev

WORKDIR /app

RUN git clone https://github.com/beefproject/beef.git .

RUN gem install bundler

RUN bundle config set without development test

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install

ENV PORT=3000

EXPOSE 3000

CMD ["ruby", "beef"]
