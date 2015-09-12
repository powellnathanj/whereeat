FROM centos:7

RUN yum update -y
RUN yum install -y rubygems
RUN gem install sinatra
COPY app.rb /
COPY whereeat.rb /

VOLUME ['/data']

EXPOSE 8080

CMD ["ruby", "/app.rb"]
