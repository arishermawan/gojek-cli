require 'json'

module GoCLI
  # class User
  class User
    attr_accessor :name, :phone, :password, :email

    def initialize(opts = {})
      @name = opts[:name] || ''
      @email = opts[:email] || ''
      @phone = opts[:phone] || ''
      @password = opts[:password] || ''
    end

    def self.load
      return nil unless File.file?("#{File.expand_path(File.dirname(__FILE__))}/../../data/user.json")

      file = File.read("#{File.expand_path(File.dirname(__FILE__))}/../../data/user.json")
      data = JSON.parse(file)

      self.new(
        name: data['name'],
        email: data['email'],
        phone: data['phone'],
        password: data['password']
      )
    end

    def validate
      if (@name == '' || @email == '' || @phone == '' || @password == '')
        return false
      else
        return true
      end
    end

    def save!
      user = { name: @name, email: @email, phone: @phone, password: @password }
      File.open("#{File.expand_path(File.dirname(__FILE__))}/../../data/user.json", "w") do |f|
        f.write JSON.generate(user)
      end
    end
  end
end
