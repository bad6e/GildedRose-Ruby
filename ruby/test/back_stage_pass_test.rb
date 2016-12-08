require_relative "test_helper"

class BackStagePassTest < Minitest::Test
  def test_back_stage_passes_sell_in_value_decreases_by_1_at_the_end_of_each_day
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 5)
    BackStagePass.new(item)
    assert_equal(1, item.sell_in)
  end

  def test_back_stage_passes_qal_increases_by_1_at_the_end_of_each_day
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 5)
    BackStagePass.new(item)
    assert_equal(6, item.quality)
  end

  def test_back_stage_passes_qal_increases_by_2_when_there_are_10_sell_in_days_left
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)
    BackStagePass.new(item)
    assert_equal(12, item.quality)
  end

  def test_back_stage_passes_qal_increases_by_2_when_sell_days_are_less_than_10_but_more_than_5
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 10)
    BackStagePass.new(item)
    assert_equal(12, item.quality)
  end

  def test_back_stage_passes_qal_increases_by_3_when_there_are_5_sell_in_days_left
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)
    BackStagePass.new(item)
    assert_equal(13, item.quality)
  end

  def test_back_stage_passes_qal_increases_by_3_when_sell_days_are_less_than_5_but_more_than_0
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 10)
    BackStagePass.new(item)
    assert_equal(13, item.quality)
  end

  def test_back_stage_passes_qal_drops_to_0_when_there_are_0_sell_in_days_left
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)
    BackStagePass.new(item)
    assert_equal(0, item.quality)
  end

  def test_back_stage_passes_qal_drops_to_0_when_there_are_negative_sell_in_days_left
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", -2, 10)
    BackStagePass.new(item)
    assert_equal(0, item.quality)
  end

  def test_back_stage_passes_qal_will_never_increase_above_50
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 49.5)
    BackStagePass.new(item)
    assert_equal(50, item.quality)
  end

  def test_back_stage_passes_qal_will_never_increase_above_50__when_less_than_5_days_to_concert
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 49.5)
    BackStagePass.new(item)
    assert_equal(50, item.quality)
  end

  def test_back_stage_passes_qal_will_never_increase_above_50_when_less_than_10_days_to_concert
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 49.5)
    BackStagePass.new(item)
    assert_equal(50, item.quality)
  end

  def test_test_fixture_data_1
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    BackStagePass.new(item)
    assert_equal(14, item.sell_in)
    assert_equal(21, item.quality)
  end

  def test_test_fixture_data_2
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 49)
    BackStagePass.new(item)
    assert_equal(9, item.sell_in)
    assert_equal(50, item.quality)
  end

  def test_test_fixture_data_3
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 49)
    BackStagePass.new(item)
    assert_equal(4, item.sell_in)
    assert_equal(50, item.quality)
  end
end
