module University
  require '../app/University/Item'

  class User

    # generate getter and setter for name and grades
    attr_accessor :name, :credits, :items

    # factory method (constructor) on the class
    def self.named( name )
      user = self.new
      user.name = name
      user.credits = 100
      user
    end

    def initialize
      self.items = Array.new
    end

    def to_s
      # string interpolation
      "#{name} #{credits}"
    end

    def add_credits( credits_to_add )
      credits += credits_to_add
    end

    def remove_credits( credits_to_remove )
      credits -= credits_to_remove
    end

    def create_item( name, price )
      items.push(University::Item.create(self, name, price))
    end

  end

end