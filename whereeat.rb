#!/usr/bin/env ruby

require 'sinatra'
require 'csv'

set :bind, '0.0.0.0'
set :port, 8080

begin
    food = CSV.read("locations.csv")
rescue Errno::ENOENT
    food = ['Location file does not exist'] 
end

get '/' do
  food.sample()
end
