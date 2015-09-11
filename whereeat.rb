#!/usr/bin/env ruby

require 'sinatra'

set :bind, '0.0.0.0'
set :port, 8080

food = ["Panera", "Isaac's", "Chipotle", "Red Robin", "Chocolate Ave Grille"]

get '/' do
  food.sample()
end
