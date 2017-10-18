# TODO: Complete Order class

require 'json'
require 'date'

module GoCLI
  class Order
    attr_accessor :origin, :destination, :cost
    def initialize(origin, destination, cost)
      @timestamp = Time.now
      @origin = origin
      @destination = destination
      @cost = cost
    end

    # def insert_order





    # end

    def self.get_all_orders
      file = File.read("#{File.expand_path(File.dirname(__FILE__))}/../../data/orders.json")
      data = JSON.parse(file)
    end

  end
end
