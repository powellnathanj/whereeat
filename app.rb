#!/usr/bin/env ruby

require 'sinatra'
require_relative 'whereeat'

whereeat = Whereeat.new

### Sinatra Settings ###
set :bind, '0.0.0.0'
set :port, 8080

get '/' do
    whereeat.where_is_lunch
end

post '/locations/:location' do

end

post '/locations/:location' do

end
