require 'sequel'
require 'sqlite3'

DB = Sequel.sqlite

DB.create_table :places do
  primary_key :id
  String      :name
end

Sequel::Model.plugin :json_serializer, :naked => true

class Place < Sequel::Model
end
