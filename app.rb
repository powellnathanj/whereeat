#!/usr/bin/env ruby

require 'sinatra'
require_relative 'database'

### Sinatra Settings ###
set :bind, '0.0.0.0'
set :port, 8080

get '/' do
  ""
end

get '/places' do
  content_type :json
  Place.all.to_json
end

get '/places/:id' do
  content_type :json
  place = Place[params[:id]]
  return status 404 if place.nil?
  place.to_json
end

post '/places' do
  place = Place.create(:name => params['name'])
  status 201
end

put '/places/:id' do
  place = Place.find(params[:id])
  return status 404 if place.nil?
  place.update(params[:name])
  place.save
  status 202
end

delete '/places/:id' do
  place = Place[params[:id]]
  return status 404 if place.nil?
  place.delete
  status 202
end
