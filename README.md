# Whereeat: what's for lunch?
Do you have trouble deciding where to eat lunch everyday? Wouldn't it be nice if someone or something could just decide for you? Well, now there is! Whereeat is an Sinatra application that allows you to input all your favorite places to eat then allows you to request for a location. It takes the stress out of deciding where to eat, and lets you focus on the eating part.

## Getting Started
Whereeat is a Sinatra application, we provide you with a Dockerfile to build an image, so that you can get up and running quickly. You may also set up your own application server (eq. apache passenger), and run Whereeat where it makes sense for you

### Get it
First you need to clone the repository
```bash
[ root@harbor  ~ ] $ git clone git@github.com:slaney/whereeat.git
Cloning into 'whereeat'...
remote: Counting objects: 12, done.
remote: Compressing objects: 100% (11/11), done.
remote: Total 12 (delta 3), reused 10 (delta 1), pack-reused 0
Receiving objects: 100% (12/12), done.
Resolving deltas: 100% (3/3), done.
```

### Fill it
Then you need to populate the application with your favorite places to eat, then save it
```bash
[ root@harbor [update-docs] whereeat ] $ vi whereeat.rb
  1 #!/usr/bin/env ruby
  2
  3 require 'sinatra'
  4
  5 set :bind, '0.0.0.0'
  6 set :port, 8080
  7
  8 food = ["Panera", "Isaac's", "Chipotle", "Red Robin", "Chocolate Ave Grille"]
  9
 10 get '/' do
 11   food.sample()
 12 end
```

### Build it
Almost there! We need to build the image first, then run it
```bash
[ root@harbor [update-docs] whereeat ] $ docker build -t nathanpowell/whereeat:v1 .
Sending build context to Docker daemon 52.74 kB
Step 0 : FROM centos:7
Status: Downloaded newer image for centos:7
 ---> 0f73ae75014f
Step 1 : RUN yum update -y
 ---> Running in 2ff095da1e74
 < left out bunch of output >
 ---> c6ce59769fd5
Removing intermediate container 2ff095da1e74
Step 2 : RUN yum install -y rubygems
 ---> Running in abdf61db9851
 < left out bunch of output >
 ---> fb71e7016474
Removing intermediate container abdf61db9851
Step 3 : RUN gem install sinatra
 ---> Running in 78cd81610c37
 < left out bunch of output >
 ---> 42851c8eca5a
Removing intermediate container 78cd81610c37
Step 4 : COPY whereeat.rb /
 ---> 6cd0cddb8f8d
Removing intermediate container 5f841c17ab7a
Step 5 : EXPOSE 8080
 ---> Running in 65a314a5f133
 ---> 01f7b53d8d7f
Removing intermediate container 65a314a5f133
Step 6 : CMD ruby /whereeat.rb
 ---> Running in e1e67f103a67
 ---> 78c34a8b5dc9
Removing intermediate container e1e67f103a67
Successfully built 78c34a8b5dc9
```

### Run it
And now we are ready! We can finally run our application, and find out where we're eating lunch, I'm getting hungry.
```bash
[ root@harbor [update-docs] whereeat ] $ docker run -d -p 8080:8080 nathanpowell/whereeat:v1
7b53110fa0509b65b4f0e6ce6c63eedaaafc23cc6b48232b5db9d76b2ab2152c
```

### Go to lunch
```bash
[ root@harbor [update-docs] whereeat ] $ curl http://localhost:8080
Chocolate Ave Grille
```
