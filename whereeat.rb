#!/usr/bin/env ruby

require 'json'

class Whereeat
    def initialize
        @locations = Array.new
    end

    def read_locations
        begin
            f = File.read('locations.json')
            @locations = JSON.parse(f)
        rescue Errno::ENOENT
            @locations = ['Location file does not exist'] 
        end
    end

    def where_is_lunch
        read_locations
        return @locations.sample()
    end
end
