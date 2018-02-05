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

  def test_undefined_plural_method_return_its_result
    assert { @guest.planets == [] }
  end

  def test_undefined_plural_method_with_undersores_return_its_result
    assert { @guest.planets_and_monkeys == [] }
  end

  def test_undefined_plural_method_with_undersore_at_the_end_return_its_result
    assert { @guest.planets_.nil? }
  end
end
