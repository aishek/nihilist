require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/power_assert'

require 'nigilist'

class Guest
  include Nigilist

  def hosts
    :all
  end

  def polite?
    true
  end

  def planet
    'Earth'
  end
end

class NigilistTest < Minitest::Test
  def setup
    @guest = Guest.new
  end

  def test_question_end_method_return_false
    assert { @guest.admin? == false }
  end

  def test_explicit_defined_question_end_method_return_its_result
    assert { @guest.polite? == true }
  end

  def test_non_bang_end_method_return_nil
    assert { @guest.name.nil? }
  end

  def test_explicit_non_bang_end_method_return_its_result
    assert { @guest.planet == 'Earth' }
  end

  def test_plural_method_return_empty_array
    assert { @guest.planets == [] }
  end

  def test_plural_method_with_undersores_return_empty_array
    assert { @guest.planets_and_monkeys == [] }
  end

  def test_explicit_plural_method_return_its_result
    assert { @guest.hosts == :all }
  end

  def test_plural_method_with_undersore_at_the_end_return_nil
    assert { @guest.monkeys_ == nil }
  end

  def test_method_with_doudle_s_ending_return_nil
    assert { @guest.stress == nil }
  end

  def test_respond_to_plural_method
    assert { @guest.respond_to?(:socks) }
  end

  def test_respond_to_question_method
    assert { @guest.respond_to?(:intresting?) }
  end

  def test_respond_to_question_method
    assert { @guest.respond_to?(:mess) }
  end

  def test_does_not_respond_to_bang_method
    assert { !@guest.respond_to?(:catch!) }
  end
end
