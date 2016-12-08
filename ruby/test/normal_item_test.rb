require_relative "test_helper"

class NormalItemTest < Minitest::Test
  def test_wolf_tshirt_sell_in_decreases_by_1_at_the_end_of_each_day
    item = Item.new("Wolf T-Shirt", 2, 5)
    NormalItem.new(item)
    assert_equal(1, item.sell_in)
  end

  def test_wolf_tshirt_qal_decreases_by_1_at_the_end_of_each_day
    item = Item.new("Wolf T-Shirt", 10, 5)
    NormalItem.new(item)
    assert_equal(4, item.quality)
  end

  def test_wolf_tshirt_qal_will_never_increase_above_50
    item = Item.new("Wolf T-Shirt", 10, 50)
    NormalItem.new(item)
    assert_equal(49, item.quality)
  end

  def test_wolf_tshirt_qal_will_never_be_negative
    item = Item.new("Wolf T-Shirt", 1, 0.5)
    NormalItem.new(item)
    assert_equal(0, item.quality)
  end

  def test_when_wolf_tshirt_sell_in_date_reaches_0_qal_decreases_twice_as_fast
    item = Item.new("Wolf T-Shirt", 0, 5)
    NormalItem.new(item)
    assert_equal(3, item.quality)
  end

  def test_when_wolf_tshirt_sell_in_date_reaches_less_than_0_qal_decreases_twice_as_fast
    item = Item.new("Wolf T-Shirt", -1, 7)
    NormalItem.new(item)
    assert_equal(5, item.quality)
  end

  def test_when_wolf_tshirt_sell_in_date_is_less_than_0_qal_decreases_twice_as_fast_but_never_negative
    item = Item.new("Wolf T-Shirt", -1, 0.5)
    NormalItem.new(item)
    assert_equal(0, item.quality)
  end

  def test_text_fixture_data_1
    item = Item.new("+5 Dexterity Vest", 10, 20)
    NormalItem.new(item)
    assert_equal(9, item.sell_in)
    assert_equal(19, item.quality)
  end

  def test_text_fixture_data_2
    item = Item.new("Elixir of the Mongoose", 5, 7)
    NormalItem.new(item)
    assert_equal(4, item.sell_in)
    assert_equal(6, item.quality)
  end
end
