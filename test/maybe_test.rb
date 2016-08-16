require 'test_helper'

class MaybeTest < Minitest::Test
  def setup
    @maybe = Maybe(nil)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Maybe::VERSION
  end

  def test_missing_method_returns_itself
    assert @maybe, @maybe.undefined_method
  end

  def test_is_nil
    assert true, @maybe.nil?
  end

  def test_conversions
    assert [], @maybe.to_a
    assert "", @maybe.to_s
    assert 0.0, @maybe.to_f
    assert 0, @maybe.to_i
  end

  def test_rails_helpers
    assert_same false, @maybe.present?
    assert_same true, @maybe.empty?
  end

  def test_misc
    assert_silent{ @maybe.tap { raise } }
  end
end

class MaybeNotNilTest < Minitest::Test
  def setup
    @maybe = Maybe(Object.new)
  end

  def test_constructor_returns_not_nil
    refute_nil @maybe
  end
end
