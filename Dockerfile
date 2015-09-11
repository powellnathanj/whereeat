FROM centos:7

RUN yum update -y
RUN yum install -y rubygems
RUN gem install sinatra
COPY whereeat.rb /

EXPOSE 8080

CMD ["ruby", "/whereeat.rb"]