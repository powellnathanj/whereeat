This is a docker container that will run a small sinatra app that will tell you where to have lunch.

clone the repo

  git clone https://github.com/slaney/whereeat.git

populate the food array with your favorite places

  cd whereeat
  vim whereeat.rb
  :wq

build the image

  docker build -t nathanpowell/whereeat:v1 .

run the container

  docker run -d -p 8080:8080 nathanpowell/whereeat:v1

run container. hit web service. go to lunch.

  wget -qO- http://localhost:8080 && echo
