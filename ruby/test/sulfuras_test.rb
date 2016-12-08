require_relative "test_helper"

class SulfurasTest < Minitest::Test
  def test_sulfuras_sell_in_value_never_decreases_at_the_end_of_each_day
    item = Item.new("Sulfuras, Hand of Ragnaros", 2, 5)
    Sulfuras.new(item)
    assert_equal(2, item.sell_in)
  end

  def test_sulfuras_quality_never_changes_and_it_is_at_80_when_set_at_80
    item = Item.new("Sulfuras, Hand of Ragnaros", 20, 80)
    Sulfuras.new(item)
    assert_equal(80, item.quality)
  end

  def test_sulfuras_quality_is_whatever_you_set_it_be_and_will_never_change
    item = Item.new("Sulfuras, Hand of Ragnaros", 20, 50)
    100.times do
      Sulfuras.new(item)
      assert_equal(50, item.quality)
    end
  end

  def test_sulfuras_sell_in_is_whatever_you_set_it_be_and_will_never_change
    item = Item.new("Sulfuras, Hand of Ragnaros", 20, 50)
    100.times do
      Sulfuras.new(item)
      assert_equal(20, item.sell_in)
    end
  end

  def test_text_fixture_data_one
    item_one = Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
    Sulfuras.new(item_one)
    assert_equal(0, item_one.sell_in)
    assert_equal(80, item_one.quality)
  end

  def test_text_fixture_data_two
    item_two = Item.new("Sulfuras, Hand of Ragnaros", 1, 80)
    Sulfuras.new(item_two)
    assert_equal(1, item_two.sell_in)
    assert_equal(80, item_two.quality)
  end
end
