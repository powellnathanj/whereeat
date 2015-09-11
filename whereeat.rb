#!/usr/bin/env ruby

require 'sinatra'

set :bind, '0.0.0.0'
set :port, 8080

food = ["Arbys", "Chocolate Ave Grill", "Isaac's"]

get '/' do
  food.sample()
end
