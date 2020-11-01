FROM ruby:2.7.1-alpine

RUN apk add --update build-base postgresql-dev tzdata nodejs yarn

RUN gem install bundler -v 2.1.4

RUN cp /usr/share/zoneinfo/Europe/London /etc/localtime && \
  echo "Europe/London" > /etc/timezone

WORKDIR /app
COPY Gemfile* .ruby-version ./

RUN bundle install --no-binstubs --retry=5 --jobs=4

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .

EXPOSE 3000

RUN bundle exec rake assets:precompile

CMD bundle exec rails db:migrate && bundle exec rails server -b 0.0.0.0