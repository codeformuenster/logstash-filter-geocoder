FROM jruby:1.7-jdk
# FROM ruby

WORKDIR /usr/local/src
COPY . /usr/local/src

# RUN bundle install \
#  && bundle exec rspec

RUN gem build *.gemspec \
  && mkdir /build-result \
  && cp /usr/local/src/*.gem /build-result/

WORKDIR /build-result
CMD tar -c .
