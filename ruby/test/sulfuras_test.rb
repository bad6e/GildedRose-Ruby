require_relative "test_helper"
require "./lib/gilded_rose"
require "./lib/item"
require "./lib/sulfuras"

class SulfurasTest < Minitest::Test
  def test_sulfuras_sell_in_value_never_decreases_at_the_end_of_each_day
    items = [Item.new("Sulfuras, Hand of Ragnaros", 2, 5)]
    GildedRose.new(items).update_quality()
    assert_equal(2, items.fetch(0).sell_in)
  end

  def test_sulfuras_quality_never_changes_and_it_is_at_80
    items = [Item.new("Sulfuras, Hand of Ragnaros", 20, 80)]
    GildedRose.new(items).update_quality()
    assert_equal(80, items.fetch(0).quality)
  end

  def test_sulfuras_quality_is_whatever_you_set_it_be_and_will_never_change
    items = [Item.new("Sulfuras, Hand of Ragnaros", 20, 50)]
    100.times do
      GildedRose.new(items).update_quality()
      assert_equal(50, items.fetch(0).quality)
    end
  end

  def test_sulfuras_sell_in_is_whatever_you_set_it_be_and_will_never_change
    items = [Item.new("Sulfuras, Hand of Ragnaros", 20, 50)]
    100.times do
      GildedRose.new(items).update_quality()
      assert_equal(20, items.fetch(0).sell_in)
    end
  end

  def test_test_fixture_data
    items_one = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
    GildedRose.new(items_one).update_quality()
    assert_equal(0, items_one.fetch(0).sell_in)
    assert_equal(80, items_one.fetch(0).quality)

    items_two = [Item.new("Sulfuras, Hand of Ragnaros", 1, 80)]
    GildedRose.new(items_two).update_quality()
    assert_equal(1, items_two.fetch(0).sell_in)
    assert_equal(80, items_two.fetch(0).quality)
  end
end
