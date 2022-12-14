FROM ruby:3-alpine
WORKDIR /app
RUN apk add --no-cache build-base tzdata nodejs yarn sqlite-dev postgresql-dev mysql-dev
RUN gem install bundler
COPY . .
RUN bundle install
ENV RAILS_ENV=production
RUN bundle exec rails db:migrate
RUN bundle exec rails assets:precompile
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
