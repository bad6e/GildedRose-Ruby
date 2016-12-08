require_relative "test_helper"
require "./lib/gilded_rose"
require "./lib/item"
require "./lib/normal_item"

class NormalItemTest < Minitest::Test
  def test_wolf_tshirt_sell_in_value_decreases_by_1_at_the_end_of_each_day
    items = [Item.new("Wolf T-Shirt", 2, 5)]
    GildedRose.new(items).update_quality()
    assert_equal(1, items.fetch(0).sell_in)
  end

  def test_wolf_tshirt_qal_decreases_by_1_at_the_end_of_each_day
    items = [Item.new("Wolf T-Shirt", 10, 5)]
    GildedRose.new(items).update_quality()
    assert_equal(4, items.fetch(0).quality)
  end

  def test_wolf_tshirt_qal_will_never_increase_above_50
    items = [Item.new("Wolf T-Shirt", 10, 50)]
    GildedRose.new(items).update_quality()
    assert_equal(49, items.fetch(0).quality)
  end

  def test_wolf_tshirt_qal_will_never_be_negative
    items = [Item.new("Wolf T-Shirt", 1, 0.5)]
    GildedRose.new(items).update_quality()
    assert_equal(0, items.fetch(0).quality)
  end

  def test_when_wolf_tshirt_sell_in_date_reaches_0_qal_decreases_twice_as_fast
    items = [Item.new("Wolf T-Shirt", 0, 5)]
    GildedRose.new(items).update_quality()
    assert_equal(3, items.fetch(0).quality)
  end

  def test_when_wolf_tshirt_sell_in_date_reaches_less_than_0_qal_decreases_twice_as_fast
    items = [Item.new("Wolf T-Shirt", -1, 7)]
    GildedRose.new(items).update_quality()
    assert_equal(5, items.fetch(0).quality)
  end

  def test_when_wolf_tshirt_sell_in_date_is_than_0_qal_decreases_twice_as_fast_but_never_negative
    items = [Item.new("Wolf T-Shirt", -1, 0.5)]
    GildedRose.new(items).update_quality()
    assert_equal(0, items.fetch(0).quality)
  end
end
