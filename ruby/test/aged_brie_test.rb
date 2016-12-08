require_relative "test_helper"
require "./lib/gilded_rose"
require "./lib/item"
require "./lib/aged_brie"

class AgedBrieTest < Minitest::Test
  def test_aged_brie_sell_in_value_decreases_by_1_at_the_end_of_each_day
    items = [Item.new("Aged Brie", 2, 5)]
    GildedRose.new(items).update_quality()
    assert_equal(1, items.fetch(0).sell_in)
  end

  def test_aged_brie_quality_increases_by_1_at_the_end_of_each_day
    items = [Item.new("Aged Brie", 10, 5)]
    GildedRose.new(items).update_quality()
    assert_equal(6, items.fetch(0).quality)
  end

  def test_aged_brie_quality_will_never_increase_above_50
    items = [Item.new("Aged Brie", 10, 49.5)]
    GildedRose.new(items).update_quality()
    assert_equal(50, items.fetch(0).quality)
  end

  def test_aged_brie_quality_will_never_increase_above_50_even_with_negative_sell_in_date
    items = [Item.new("Aged Brie", -100, 48.5)]
    GildedRose.new(items).update_quality()
    assert_equal(50, items.fetch(0).quality)
  end

  def test_aged_brie_quality_will_never_be_negative
    #
    items = [Item.new("Aged Brie", 10, 0)]
    GildedRose.new(items).update_quality()
    assert(1, items.fetch(0).quality)
  end

  def test_when_aged_brie_sell_in_date_reaches_0_quality_increase_twice_as_fast
    items = [Item.new("Aged Brie", 0, 5)]
    GildedRose.new(items).update_quality()
    assert_equal(7, items.fetch(0).quality)
  end

  def test_when_aged_brie_sell_in_date_reaches_less_than_0_quality_increase_twice_as_fast
    items = [Item.new("Aged Brie", -1, 7)]
    GildedRose.new(items).update_quality()
    assert_equal(9, items.fetch(0).quality)
  end

  def test_test_fixture_data
    items = [Item.new("Aged Brie", 2, 0)]
    GildedRose.new(items).update_quality()
    assert_equal(1, items.fetch(0).sell_in)
    assert_equal(1, items.fetch(0).quality)
  end
end
