require_relative "test_helper"

class BackStagePassTest < Minitest::Test
  def test_back_stage_passes_sell_in_value_decreases_by_1_at_the_end_of_each_day
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 5)]
    GildedRose.new(items).update_quality()
    assert_equal(1, items.fetch(0).sell_in)
  end

  def test_back_stage_passes_qal_increases_by_1_at_the_end_of_each_day
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 5)]
    GildedRose.new(items).update_quality()
    assert_equal(6, items.fetch(0).quality)
  end

  def test_back_stage_passes_qal_increases_by_2_when_there_are_10_sell_in_days_left
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
    GildedRose.new(items).update_quality()
    assert_equal(12, items.fetch(0).quality)
  end

  def test_back_stage_passes_qal_increases_by_2_when_sell_days_are_less_than_10_but_more_than_5
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 10)]
    GildedRose.new(items).update_quality()
    assert_equal(12, items.fetch(0).quality)
  end

  def test_back_stage_passes_qal_increases_by_3_when_there_are_5_sell_in_days_left
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
    GildedRose.new(items).update_quality()
    assert_equal(13, items.fetch(0).quality)
  end

  def test_back_stage_passes_qal_increases_by_3_when_sell_days_are_less_than_5_but_more_than_0
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 10)]
    GildedRose.new(items).update_quality()
    assert_equal(13, items.fetch(0).quality)
  end

  def test_back_stage_passes_qal_drops_to_0_when_there_are_0_sell_in_days_left
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
    GildedRose.new(items).update_quality()
    assert_equal(0, items.fetch(0).quality)
  end

  def test_back_stage_passes_qal_drops_to_0_when_there_are_negative_sell_in_days_left
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", -2, 10)]
    GildedRose.new(items).update_quality()
    assert_equal(0, items.fetch(0).quality)
  end

  def test_back_stage_passes_qal_will_never_increase_above_50
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 49.5)]
    GildedRose.new(items).update_quality()
    assert_equal(50, items.fetch(0).quality)
  end

  def test_back_stage_passes_qal_will_never_increase_above_50_even_when_close_to_concert_less_than_5_days
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 49.5)]
    GildedRose.new(items).update_quality()
    assert_equal(50, items.fetch(0).quality)
  end

   def test_back_stage_passes_qal_will_never_increase_above_50_even_when_close_to_concert_less_than_10_days
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 49.5)]
    GildedRose.new(items).update_quality()
    assert_equal(50, items.fetch(0).quality)
  end

  def test_test_fixture_data_1
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
    GildedRose.new(items).update_quality()
    assert_equal(14, items.fetch(0).sell_in)
    assert_equal(21, items.fetch(0).quality)
  end

  def test_test_fixture_data_2
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 49)]
    GildedRose.new(items).update_quality()
    assert_equal(9, items.fetch(0).sell_in)
    assert_equal(50, items.fetch(0).quality)
  end

  def test_test_fixture_data_3
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 49)]
    GildedRose.new(items).update_quality()
    assert_equal(4, items.fetch(0).sell_in)
    assert_equal(50, items.fetch(0).quality)
  end
end
