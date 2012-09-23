module University
  require '../app/University/item'

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
      "#{name} #{credits}"
    end

    def create_item( name, price )
      items.push(University::Item.create(self, name, price))
    end

    def remove_item( name )
      self.items = items.map { |item| item.name == name ? nil : item } .compact
    end

    def owns?( item_name )
       item = self.items.select { |item| item.name == item_name }.pop
       !item.nil? && item.owner == self
    end

    def offer( name )
      self.items.each { |item| item.name == name ? item.activate : nil }
    end

    def offers()
      self.items.select { |item| item.is_active? }
    end

    def sells?( item_name )
      item = self.items.select { |item| item.name == item_name }.pop

      !item.nil? && item.is_active?
    end

    def sell( item_name, buyer)
      item = self.items.select { |item| item.name == item_name }.pop

      if item.nil?
        puts "Transaction failed because #{name} does not own \'#{item_name}\'"
        return FALSE
      elsif ! item.is_active?
        puts "Transaction failed because #{name} does not sale \'#{item_name}\'"
        return FALSE
      elsif buyer.credits < item.price
        puts "Transaction failed because #{buyer.name} does not have enough money"
        return FALSE
      end

      buyer.credits -= item.price
      self.credits += item.price
      self.items.delete(item)
      buyer.add_item(item)
      item.owner = buyer
      TRUE
    end

    def add_item( item )
      self.items.push(item)
    end

  end

end