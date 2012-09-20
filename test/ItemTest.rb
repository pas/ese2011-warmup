require "test/unit"
require "../app/University/Item"
require "../app/University/User"

class Item < Test::Unit::TestCase
  def test_item_should_have_a_name
    user = create_user()
    item = University::Item.create(user, 'house', 100)
    assert( item.name == 'house', 'Item should be called \'house\' but was ' + '\'' + item.name + '\' instead')
  end

  def test_item_should_have_a_price
    user = create_user()
    item = University::Item.create(user, 'house', 100)
    assert( item.price == 100, 'Item should cost \'100\' but was ' + '\'' + item.price.to_s + '\' instead')
  end

  def test_item_should_be_inactive
    user = create_user()
    item = University::Item.create(user, 'house', 100)
    assert(! item.is_active?, 'Item should inactive after creation.')
  end

  def test_item_should_have_owner
    user = create_user()
    item = University::Item.create(user, 'house', 100)
    assert(item.owner == user, "Jane should be owner.")
  end

  def create_user()
    University::User.named('Jane')
  end

  def test_item_should_set_active
    user = create_user()
    item = University::Item.create(user, 'house', 100)
    item.activate()
    assert(item.is_active?, 'Item should be activated.')
    item.deactivate()
    assert(! item.is_active?, 'Item should be deactivated.')
  end
end