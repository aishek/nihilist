# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/power_assert'

require 'nigilist'

class Guest
  include Nigilist

  def costs
    {}
  end
end

class NigilistRailsTest < Minitest::Test
  def setup
    Object.const_set('Rails', Module.new)

    String.define_method :singularize do self[0..-2] end
    String.define_method :camelize do capitalize end
    String.define_method :safe_constantize do
      if self == 'Post'
        return Class.new do
          def self.none
            :fake_active_record_null_relation
          end
        end
      end
      nil
    end

    @guest = Guest.new
  end

  def test_explicit_plural_method_without_active_record_model_return_its_value
    assert { @guest.costs == {} }
  end

  def test_plural_method_without_active_record_model_return_empty_array
    assert { @guest.planets == [] }
  end

  def test_plural_method_with_active_record_model_return_null_relation
    assert { @guest.posts == :fake_active_record_null_relation }
  end

  def teardown
    Object.send(:remove_const, 'Rails')

    String.remove_method :singularize
    String.remove_method :camelize
    String.remove_method :safe_constantize
  end
end
