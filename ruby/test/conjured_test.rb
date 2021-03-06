require_relative "test_helper"

class ConjuredTest < Minitest::Test
  def test_conjured_sell_in_decreases_by_1_at_the_end_of_each_day
    item = Item.new("Conjured Mana Cake", 2, 5)
    Conjured.new(item)
    assert_equal(1, item.sell_in)
  end

  def test_conjured_qal_decreases_by_2_at_the_end_of_each_day
    item = Item.new("Conjured Mana Cake", 10, 5)
    Conjured.new(item)
    assert_equal(3, item.quality)
  end

  def test_conjured_qal_will_never_increase_above_50
    item = Item.new("Conjured Mana Cake", 10, 50)
    Conjured.new(item)
    assert_equal(48, item.quality)
  end

  def test_conjured_qal_will_never_be_negative
    item = Item.new("Conjured Mana Cake", 1, 0.5)
    Conjured.new(item)
    assert_equal(0, item.quality)
  end

  def test_when_conjured_sell_in_date_reaches_0_qal_decreases_four_times_as_fast
    item = Item.new("Conjured Mana Cake", 0, 5)
    Conjured.new(item)
    assert_equal(1, item.quality)
  end

  def test_when_conjured_sell_in_date_reaches_less_than_0_qal_decreases_twice_as_fast
    item = Item.new("Conjured Mana Cake", -1, 7)
    Conjured.new(item)
    assert_equal(3, item.quality)
  end

  def test_when_conjured_sell_in_date_is_than_0_qal_decreases_twice_as_fast_but_never_negative
    item = Item.new("Conjured Mana Cake", -1, 1)
    Conjured.new(item)
    assert_equal(0, item.quality)
  end

  def test_text_fixture_data_1
    item = Item.new("Conjured Mana Cake", 3, 6)
    Conjured.new(item)
    assert_equal(2, item.sell_in)
    assert_equal(4, item.quality)
  end
end
