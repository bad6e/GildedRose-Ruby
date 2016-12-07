require_relative "test_helper"
require "./lib/gilded_rose"
require "./lib/item"

class GildedRoseTest < Minitest::Test
  ## What do we know about aged brie

  #1. It has a sell_in value - which denotes the number of days we have to sell the item
  #2. It has a quality value - which denotes how value the item is

  #3. At the end of the day the sell_in value decreases by 1 - DONE

  #4. At the end of the day the quality increases as it gets older - by only 1 - DONE

  #5. Once the sell in date is negative - quality improves twice as fast - DONE
  #6. The quality of aged brie will never be more than 50 - DONE
  #7. The quality of aged brie will never be negative - DONE

  #Aged Brie Tests
  def test_aged_brie_sell_in_value_decreases_by_1_at_the_end_of_each_day
    items = [ Item.new("Aged Brie", 2, 5) ]
    GildedRose.new(items).update_quality()
    assert_equal(1, items.fetch(0).sell_in)
  end

  def test_aged_brie_quality_increases_by_1_at_the_end_of_each_day
    items = [ Item.new("Aged Brie", 10, 5) ]
    GildedRose.new(items).update_quality()
    assert_equal(6, items.fetch(0).quality)
  end

  def test_aged_brie_quality_will_never_increase_above_50
    items = [ Item.new("Aged Brie", 10, 50) ]
    GildedRose.new(items).update_quality()
    assert_equal(50, items.fetch(0).quality)
  end

  def test_aged_brie_quality_will_never_increase_above_50_even_with_negative_sell_in_date
    items = [ Item.new("Aged Brie", -100, 50) ]
    GildedRose.new(items).update_quality()
    assert_equal(50, items.fetch(0).quality)
  end

  def test_aged_brie_quality_will_never_be_negative
    items = [ Item.new("Aged Brie", 10, 0) ]
    51.times do
      GildedRose.new(items).update_quality()
      assert( 0 <= items.fetch(0).quality )
    end
  end

  def test_when_aged_brie_sell_in_date_reaches_0_quality_increase_twice_as_fast
    items = [ Item.new("Aged Brie", 0, 5) ]
    GildedRose.new(items).update_quality()
    assert_equal(7, items.fetch(0).quality)
  end

  def test_when_aged_brie_sell_in_date_reaches_less_than_0_quality_increase_twice_as_fast
    items = [ Item.new("Aged Brie", -1, 7) ]
    GildedRose.new(items).update_quality()
    assert_equal(9, items.fetch(0).quality)
  end

  ## What do we know about BackStage Passes

  #1. It has a sell_in value - which denotes the number of days we have to sell the item
  #2. It has a quality value - which denotes how value the item is

  #3. At the end of the day the sell_in value decreases by 1 - DONE

  #4. At the end of the day the quality increases as it gets older
    #a. Quality increases by two when there are 10 days orless 0 - DONE
    #b. Quality increases by three when there are 5 days or less - DONE
    #c. Quality drops to zero after the once the sell_in date becomes negative || 0 - DONE

  #5. The quality of BackStage Passes will never be more than 50 - DONE
  #7. The quality of BackStage Passes will never be negative - only 0 - DONE

  #Back Stage Passes Tests
  def test_back_stage_passes_sell_in_value_decreases_by_1_at_the_end_of_each_day
    items = [ Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 5) ]
    GildedRose.new(items).update_quality()
    assert_equal(1, items.fetch(0).sell_in)
  end

  def test_back_stage_passes_quality_increases_by_1_at_the_end_of_each_day
    items = [ Item.new("Aged Brie", 20, 5) ]
    GildedRose.new(items).update_quality()
    assert_equal(6, items.fetch(0).quality)
  end

  def test_back_stage_passes_quality_increases_by_2_when_there_are_10_sell_in_days_left
    items = [ Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10) ]
    GildedRose.new(items).update_quality()
    assert_equal(12, items.fetch(0).quality)
  end

  def test_back_stage_passes_quality_increases_by_2_when_there_less_than_10_but_more_than_5_sell_days_left
    items = [ Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 10) ]
    GildedRose.new(items).update_quality()
    assert_equal(12, items.fetch(0).quality)
  end

  def test_back_stage_passes_quality_increases_by_3_when_there_are_5_sell_in_days_left
    items = [ Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10) ]
    GildedRose.new(items).update_quality()
    assert_equal(13, items.fetch(0).quality)
  end

  def test_back_stage_passes_quality_increases_by_3_when_there_less_than_5_but_more_than_0_sell_days_left
    items = [ Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 10) ]
    GildedRose.new(items).update_quality()
    assert_equal(13, items.fetch(0).quality)
  end

  def test_back_stage_passes_quality_drops_to_0_when_there_are_0_sell_in_days_left
    items = [ Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10) ]
    GildedRose.new(items).update_quality()
    assert_equal(0, items.fetch(0).quality)
  end

  def test_back_stage_passes_quality_drops_to_0_when_there_are_negative_sell_in_days_left
    items = [ Item.new("Backstage passes to a TAFKAL80ETC concert", -2, 10) ]
    GildedRose.new(items).update_quality()
    assert_equal(0, items.fetch(0).quality)
  end

  def test_back_stage_passes_quality_will_never_increase_above_50
    items = [ Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 50) ]
    GildedRose.new(items).update_quality()
    assert_equal(50, items.fetch(0).quality)
  end

  def test_back_stage_passes_quality_will_never_increase_above_50_even_when_close_to_concert
    items = [ Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 50) ]
    GildedRose.new(items).update_quality()
    assert_equal(50, items.fetch(0).quality)
  end

  ## What do we know about Sulfuras, Hand of Ragnaros
  #1. It has a sell_in value - which denotes the number of days we have to sell the item
  #2. It has a quality value - which denotes how valuable the item is - and it is always at 80

  #7. The quality of Sulfuras will  always be what you set it to be - it will never change
  #8. The sell_in value will always be what you set it to be - it will never change

  #Sulfuras Tests
  def test_sulfuras_sell_in_value_never_decreases_at_the_end_of_each_day
    items = [ Item.new("Sulfuras, Hand of Ragnaros", 2, 5) ]
    GildedRose.new(items).update_quality()
    assert_equal(2, items.fetch(0).sell_in)
  end

  def test_sulfuras_quality_never_changes_and_it_is_at_80
    items = [ Item.new("Sulfuras, Hand of Ragnaros", 20, 80) ]
    GildedRose.new(items).update_quality()
    assert_equal(80, items.fetch(0).quality)
  end

  def test_sulfuras_quality_is_whatever_you_set_it_be_and_will_never_change
    items = [ Item.new("Sulfuras, Hand of Ragnaros", 20, 50) ]
    100.times do
      GildedRose.new(items).update_quality()
      assert_equal(50, items.fetch(0).quality)
    end
  end

  def test_sulfuras_sell_in_is_whatever_you_set_it_be_and_will_never_change
    items = [ Item.new("Sulfuras, Hand of Ragnaros", 20, 50) ]
    100.times do
      GildedRose.new(items).update_quality()
      assert_equal(20, items.fetch(0).sell_in)
    end
  end

  ## What do we know about Generic Items

  #1. It has a sell_in value - which denotes the number of days we have to sell the item
  #2. It has a quality value - which denotes how value the item is

  #3. At the end of the day the sell_in value decreases by 1 - DONE
  #4. At the end of the day the quality decrease as it gets older - by only 1 - DONE
  #5. Once the sell in date is negative - quality degrades twice as fast
  #6. The quality of a generic item will never be negative
  #6. The quality of a generic item will never be over 50

  #Generic Item
  def test_wolf_tshirt_sell_in_value_decreases_by_1_at_the_end_of_each_day
    items = [ Item.new("Wolf T-Shirt", 2, 5) ]
    GildedRose.new(items).update_quality()
    assert_equal(1, items.fetch(0).sell_in)
  end

  def test_wolf_tshirt_quality_decreases_by_1_at_the_end_of_each_day
    items = [ Item.new("Wolf T-Shirt", 10, 5) ]
    GildedRose.new(items).update_quality()
    assert_equal(4, items.fetch(0).quality)
  end

  # def test_wolf_tshirt_quality_will_never_increase_above_50
  #   items = [ Item.new("Wolf T-Shirt", 10, 52) ]
  #   GildedRose.new(items).update_quality()
  #   assert_equal(49, items.fetch(0).quality)
  # end

  def test_wolf_tshirt_quality_will_never_increase_above_50
    items = [ Item.new("Wolf T-Shirt", 10, 50) ]
    GildedRose.new(items).update_quality()
    assert_equal(49, items.fetch(0).quality)
  end

  def test_wolf_tshirt_quality_will_never_be_negative
    items = [ Item.new("Wolf T-Shirt", 10, 0) ]
    51.times do
      GildedRose.new(items).update_quality()
      assert( 0 <= items.fetch(0).quality )
    end
  end

  def test_when_wolf_tshirt_sell_in_date_reaches_0_quality_decreases_twice_as_fast
    items = [ Item.new("Wolf T-Shirt", 0, 5) ]
    GildedRose.new(items).update_quality()
    assert_equal(3, items.fetch(0).quality)
  end

  def test_when_wolf_tshirt_sell_in_date_reaches_less_than_0_quality_decreases_twice_as_fast
    items = [ Item.new("Wolf T-Shirt", -1, 7) ]
    GildedRose.new(items).update_quality()
    assert_equal(5, items.fetch(0).quality)
  end

  def test_when_wolf_tshirt_sell_in_date_reaches_less_than_0_quality_decreases_twice_as_fast_but_never_negative
    items = [ Item.new("Wolf T-Shirt", -1, 1) ]
    GildedRose.new(items).update_quality()
    assert_equal(0, items.fetch(0).quality)
  end
end