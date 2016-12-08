require_relative "test_helper"
require "./lib/gilded_rose"
require "./lib/item"
require "./lib/conjured"

class ConjuredTest < Minitest::Test
  def test_conjured_sell_in_value_decreases_by_1_at_the_end_of_each_day
    items = [Item.new("Conjured", 2, 5)]
    GildedRose.new(items).update_quality()
    assert_equal(1, items.fetch(0).sell_in)
  end

  def test_conjured_qal_decreases_by_2_at_the_end_of_each_day
    items = [Item.new("Conjured", 10, 5)]
    GildedRose.new(items).update_quality()
    assert_equal(3, items.fetch(0).quality)
  end

  def test_conjured_qal_will_never_increase_above_50
    items = [Item.new("Conjured", 10, 50)]
    GildedRose.new(items).update_quality()
    assert_equal(48, items.fetch(0).quality)
  end

  def test_conjured_qal_will_never_be_negative_part
    items = [Item.new("Conjured", 1, 0.5)]
    GildedRose.new(items).update_quality()
    assert_equal(0, items.fetch(0).quality)
  end

  def test_when_conjured_sell_in_date_reaches_0_qal_decreases_four_times_as_fast
    items = [Item.new("Conjured", 0, 5)]
    GildedRose.new(items).update_quality()
    assert_equal(1, items.fetch(0).quality)
  end

  def test_when_conjured_sell_in_date_reaches_less_than_0_qal_decreases_twice_as_fast
    items = [Item.new("Conjured", -1, 7)]
    GildedRose.new(items).update_quality()
    assert_equal(3, items.fetch(0).quality)
  end

  def test_when_conjured_sell_in_date_is_than_0_qal_decreases_twice_as_fast_but_never_negative
    items = [Item.new("Conjured", -1, 1)]
    GildedRose.new(items).update_quality()
    assert_equal(0, items.fetch(0).quality)
  end
end