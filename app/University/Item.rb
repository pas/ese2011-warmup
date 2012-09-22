module University
  class Item
    # generate getter and setter for name and grades
    attr_accessor :name, :price, :owner
    @active

    # factory method (constructor) on the class
    def self.create( owner, name, price )
      item = self.new
      item.name = name
      item.price = price
      item.owner = owner
      item
    end

    def initialize
      @active = FALSE
    end

    def is_active?
      @active
    end

    def activate
      @active = TRUE
    end

    def deactivate
      @active = FALSE
    end

    def to_s
      # string interpolation
      "#{name.capitalize} costs #{price} credits"
    end
  end
end