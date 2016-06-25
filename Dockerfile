FROM ruby:2.3.1

RUN apt-get -y update && apt-get install -y nginx supervisor

ADD etc/ /etc

RUN mkdir -p /data/app
ADD . /data/app

WORKDIR /data/app
RUN bundle install

CMD ["supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 80
