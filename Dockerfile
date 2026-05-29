FROM ruby:3.2

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

RUN sed -i 's/host: "127.0.0.1"/host: "0.0.0.0"/g' config.yaml

RUN gem install bundler

RUN rm -f Gemfile.lock

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install

ENV PORT=3000

EXPOSE 3000

CMD ["ruby", "beef"]
