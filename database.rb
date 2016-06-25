require 'sequel'
require 'sqlite3'
require 'logger'

# Create in-memory SQLite database
# Log SQL queries to STDOUT
DB = Sequel.sqlite '', loggers: [Logger.new($stdout)]

# Create DB Table 'Places'
DB.create_table :places do
  primary_key :id
  String      :name
end

# Make Model, enable JSON Serializer plugin
class Place < Sequel::Model
  plugin :json_serializer
end
