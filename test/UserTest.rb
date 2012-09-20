require 'test/unit'
require '../app/University/User'

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

  def test_should_create_item
    user = University::User.named('Jane')
    user.create_item('house', 100)
    assert(user.owns?('house'), 'User should own house');
  end
end