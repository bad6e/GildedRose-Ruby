require_relative "test_helper"

class GildedRoseTest < Minitest::Test
  def setup
    @items = [
      Item.new("+5 Dexterity Vest", 10, 20),
      Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
      Item.new("Aged Brie", 2, 0),
      Item.new("Conjured", 3, 6),
      Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 49)
    ]
    @gilded_rose = GildedRose.new(@items)
  end

  def test_it_creates_a_gilded_rose
    assert(@gilded_rose)
  end

  def test_it_an_array_of_items_as_attributes
    assert_equal(5, @gilded_rose.items.count)
  end

  def test_it_calls_normal_item_class_if_the_item_name_is_normal_item
    item = @gilded_rose.send(:check_type_of_item_and_call, @items.fetch(0))
    assert_equal(item.class.to_s, "NormalItem")
  end

  def test_it_calls_sulfuras_class_if_the_item_name_is_sulfuras
    item = @gilded_rose.send(:check_type_of_item_and_call, @items.fetch(1))
    assert_equal(item.class.to_s, "Sulfuras")
  end

  def test_it_calls_aged_brie_class_if_the_item_name_is_aged_brie
    item = @gilded_rose.send(:check_type_of_item_and_call, @items.fetch(2))
    assert_equal(item.class.to_s, "AgedBrie")
  end

  def test_it_calls_conjured_class_if_the_item_name_is_conjured
    item = @gilded_rose.send(:check_type_of_item_and_call, @items.fetch(3))
    assert_equal(item.class.to_s, "Conjured")
  end

  def test_it_calls_back_stage_pass_if_the_item_name_is_back_stage_pass
    item = @gilded_rose.send(:check_type_of_item_and_call, @items.fetch(4))
    assert_equal(item.class.to_s, "BackStagePass")
  end
end
