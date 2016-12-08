require_relative "test_helper"

class AgedBrieTest < Minitest::Test
  def test_aged_brie_sell_in_value_decreases_by_1_at_the_end_of_each_day
    item = Item.new("Aged Brie", 2, 5)
    AgedBrie.new(item)
    assert_equal(1, item.sell_in)
  end

  def test_aged_brie_quality_increases_by_1_at_the_end_of_each_day
    item = Item.new("Aged Brie", 10, 5)
    AgedBrie.new(item)
    assert_equal(6, item.quality)
  end

  def test_aged_brie_quality_will_never_increase_above_50
    item = Item.new("Aged Brie", 10, 49.5)
    AgedBrie.new(item)
    assert_equal(50, item.quality)
  end

  def test_aged_brie_quality_will_never_increase_above_50_with_negative_sell_in_date
    item = Item.new("Aged Brie", -100, 48.5)
    AgedBrie.new(item)
    assert_equal(50, item.quality)
  end

  def test_aged_brie_quality_will_never_be_negative
    item = Item.new("Aged Brie", 10, 0)
    AgedBrie.new(item)
    assert(1, item.quality)
  end

  def test_when_aged_brie_sell_in_date_reaches_0_quality_increases_twice_as_fast
    item = Item.new("Aged Brie", 0, 5)
    AgedBrie.new(item)
    assert_equal(7, item.quality)
  end

  def test_when_aged_brie_sell_in_date_reaches_less_than_0_quality_increases_twice_as_fast
    item = Item.new("Aged Brie", -1, 7)
    AgedBrie.new(item)
    assert_equal(9, item.quality)
  end

  def test_text_fixture_data
    item = Item.new("Aged Brie", 2, 0)
    AgedBrie.new(item)
    assert_equal(1, item.sell_in)
    assert_equal(1, item.quality)
  end
end
