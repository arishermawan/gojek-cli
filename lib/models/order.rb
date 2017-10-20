# TODO: Complete Order class

require 'json'
require 'date'

module GoCLI
  class Order
    attr_accessor :origin, :destination, :price
    def initialize(origin, destination, price)
      @timestamp = Time.now
      @origin = origin
      @destination = destination
      @price = price
    end

    def insert_order     
      data = Order.get_all_orders
      temp = []
      data.each { |hash| temp<<hash}
      temp<<order = {"timestamp":@timestamp,"origin":@origin,"destination":@destination,"est_price":@price}
      save(temp)
    end

    def self.get_all_orders
      file = File.read("#{File.expand_path(File.dirname(__FILE__))}/../../data/orders.json")
      data = JSON.parse(file)
    end

    def save(order)   
      File.open("#{File.expand_path(File.dirname(__FILE__))}/../../data/orders.json", "w") do |f|
        f.write JSON.generate(order)
      end
    end

  end
end
