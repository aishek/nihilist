require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/power_assert'

require 'nigilist'

class Guest
  include Nigilist

  def polite?
    true
  end

  def planet
    'Earth'.freeze
  end
end

class NigilistTest < Minitest::Test
  def setup
    @guest = Guest.new
  end

  def test_undefined_question_end_method_return_false
    assert { @guest.admin? == false }
  end

  def test_defined_question_end_method_return_its_result
    assert { @guest.polite? == true }
  end

  def test_undefined_non_bang_end_method_return_nil
    assert { @guest.name.nil? }
  end

  def test_defined_non_bang_end_method_return_its_result
    assert { @guest.planet == 'Earth' }
  end
end
