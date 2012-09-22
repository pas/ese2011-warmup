require 'test/unit'
require '../app/University/user'

# syntax for inheritance
class StudentTest < Test::Unit::TestCase

  def test_should_have_name
    user = University::User.named('John')
    assert( user.name == 'John', 'User should have the name \'John\' but was \'' + user.name + '\'')
  end

  def test_should_have_100_credits
    user = University::User.named('John')
    assert( user.credits  == 100, 'User should have 100 credits but has \'' + user.credits.to_s + '\'')
  end

  def test_should_have_no_house
    user = University::User.named('Jane')
    assert(! user.owns?('house'), 'User should not own a house')
  end

  def test_should_create_item
    user = University::User.named('Jane')
    user.create_item('house', 100)
    assert(user.owns?('house'), 'User should own a house')
  end

  def test_new_item_should_inactive
    user = University::User.named('Jane')
    user.create_item('house', 100)
    assert(user.owns?('house'), 'User should own a house')
    assert(!user.sells?('house'), 'User should not sell house when newly created')
  end

  def test_should_remove_item
    user = University::User.named('Jane')
    user.create_item('house', 100)
    assert(user.owns?('house'), 'User should own a house')
    user.remove_item('house')
    assert(!user.owns?('house'), 'User should not own a house')
  end

  def test_should_print_offers
    user = University::User.named('Sam')
    user.create_item('house', 100)
    user.offers()

    user.offer('house')
    user.offers()
  end

  def test_should_buy_item
    sam = University::User.named('Sam')
    frodo = University::User.named('Frodo')

    frodo.create_item('ring', 50)
    frodo.offer('ring')
    frodo.sell('ring', sam)

    assert(sam.owns?('ring'), 'Sam should own the ring now!')
    assert(!frodo.owns?('ring'), 'Frodo shouldn\'t onw the ring anymore!')
    assert(sam.credits == 50, 'Sam should pay 50 credits')
    assert(frodo.credits == 150, 'Frodo should get 50 credits')
  end

  def test_shouldnt_buy_money
    sam = University::User.named('Sam')
    frodo = University::User.named('Frodo')

    frodo.create_item('ring', 200)
    frodo.offer('ring')
    frodo.sell('ring', sam)

    assert(!sam.owns?('ring'), 'Sam shouldn\'t own the ring now!')
    assert(frodo.owns?('ring'), 'Frodo shouldn\'t own the ring anymore!')
    assert(sam.credits == 100, 'Sam should pay 50 credits')
    assert(frodo.credits == 100, 'Frodo should get 50 credits')
  end

  def test_shouldnt_buy_object
    sam = University::User.named('Sam')
    frodo = University::User.named('Frodo')

    frodo.create_item('ring', 200)
    frodo.offer('ring')
    frodo.sell('sword', sam)

    assert(!sam.owns?('sword'), 'Sam shouldn\'t own a sword now!')
    assert(!sam.owns?('ring'), 'Sam shouldn\'t own the ring now!')
    assert(frodo.owns?('ring'), 'Frodo shouldn\'t own the ring anymore!')
    assert(sam.credits == 100, 'Sam should pay 50 credits')
    assert(frodo.credits == 100, 'Frodo should get 50 credits')
  end
end