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
[ root@harbor  ~ ] $ cd whereeat
[ root@harbor [master] whereeat ] $ vi data/locations.json
[
    "Panera",
    "Isaac's",
    "Chipotle",
    "RedRobin",
    "Chocolate Ave Grille",
    "Phillip Arthurs"
]
```

### Build it
Almost there! We need to build the image first, then run it
```bash
[ root@harbor [master] whereeat ] $ docker build -t nathanpowell/whereeat .
Sending build context to Docker daemon 91.65 kB
Step 0 : FROM centos:7
 ---> 0f73ae75014f
Step 1 : RUN yum update -y
 ---> Using cache
 ---> efb1ad69f585
Step 2 : RUN yum install -y rubygems
 ---> Using cache
 ---> e3488afb14d8
Step 3 : RUN gem install sinatra
 ---> Using cache
 ---> 90c7127ee882
Step 4 : COPY app.rb /
 ---> Using cache
 ---> af80a4b60f2d
Step 5 : COPY whereeat.rb /
 ---> Using cache
 ---> b30284292b72
Step 6 : VOLUME ['/data']
 ---> Using cache
 ---> c3d11fac3142
Step 7 : EXPOSE 8080
 ---> Using cache
 ---> 7dd84b0cb4a7
Step 8 : CMD ruby /app.rb
 ---> Using cache
 ---> 15c3c61784c0
Successfully built 15c3c61784c0
```

### Run it
And now we are ready! We can finally run our application, and find out where we're eating lunch, I'm getting hungry.
```bash
[ root@harbor [update-docs] whereeat ] $ docker run -d -p 8080:8080 -v $(pwd)/data:/data nathanpowell/whereeat
7b53110fa0509b65b4f0e6ce6c63eedaaafc23cc6b48232b5db9d76b2ab2152c
```

### Go to lunch
```bash
[ root@harbor [update-docs] whereeat ] $ curl http://localhost:8080
Chocolate Ave Grille
```
