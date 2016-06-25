#!/usr/bin/env ruby

require 'sinatra'
require 'json'
require_relative 'database'

### Sinatra Settings ###
class WhereEat < Sinatra::Base
  set :bind, '0.0.0.0'
  set :port, 8080

  # Set Content-Type to application/json
  # rewind for Rack
  before do
    content_type :json
    request.body.rewind
  end

  # Return random place
  get '/' do
    Place.map(:name).sample
  end

  # Return all places
  get '/places' do
    Place.all.to_json
  end

  # Return place by id
  get '/places/:id' do
    place = Place[params[:id]]
    return status 404 if place.nil?

    place.to_json
  end

  # Create new place
  post '/places' do
    # If JSON body doesn't exist or does not have name key bail out
    json_data = JSON.parse(request.body.read)
    return status 400 if json_data.nil? || !json_data.key?('name')

    # If request is same as existing entry, bail out
    place = Place.first(name: json_data['name'])
    return status 304 unless place.nil?

    # Add new place to database
    place = Place.create(name: json_data['name'])

    place.to_json
  end

  # Modify a place by id
  put '/places/:id' do
    # Check if place exists, if not, bail out
    place = Place[params[:id]]
    return status 404 if place.nil?

    # If JSON body doesn't exist or does not have name key bail out
    json_data = JSON.parse(request.body.read)
    return status 400 if json_data.nil? || !json_data.key?('name')

    # Try to update place, if it exists then bail out
    place = place.update(name: json_data['name'])
    return status 304 if place.nil?

    # Get update place
    place = Place[params[:id]]

    place.to_json
  end

  # Delete a place by id
  delete '/places/:id' do
    # Check if place exists, if not, bail out
    place = Place[params[:id]]
    return status 404 if place.nil?

    # Delete place
    place = place.destroy

    place.to_json
  end

  # Run if file is ran directly
  run! if app_file == $PROGRAM_NAME
end
