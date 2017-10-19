# TODO: Complete Location class
require 'json'

module GoCLI
  class Location
    attr_accessor :x
    attr_accessor :y
    def initialize(x, y)
      @x=x
      @y=y
    end

    def self.is_valid?(location)
        
      # return nil unless File.file?("#{File.expand_path(File.dirname(__FILE__))}/../../data/locations.json")
      file = File.read("#{File.expand_path(File.dirname(__FILE__))}/../../data/locations.json")
      data = JSON.parse(file)
      x=0
      y=0
      location_exist = false
      data.each do |e| 
        if e.has_value?(location)
            x=e['coord'][0]
            y=e['coord'][1]
           location_exist=true
        end
      end

      if location_exist
        self.new(x,y) 
      else
        false
      end
    end

    def self.length(start, finish)
      (( (finish.x - start.x)**2 + (finish.y - start.y)**2 ).to_f) ** (0.5)
    end

    def self.get_driver
      file = File.read("#{File.expand_path(File.dirname(__FILE__))}/../../data/fleet_location.json")
      data = JSON.parse(file)
    end

  end
end
