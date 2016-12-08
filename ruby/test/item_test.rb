require_relative "test_helper"

class ItemTest < Minitest::Test
  def setup
    @item = Item.new("test_name", 2, 3)
  end

  def test_it_creates_an_item
    assert(@item)
  end

  def test_it_has_a_name_attribute
    assert_equal("test_name", @item.name)
  end

  def test_it_has_a_sell_in_attribute
    assert_equal(2, @item.sell_in)
  end

  def test_it_has_a_quality_attribute
    assert_equal(3, @item.quality)
  end

  def test_it_concatenates_3_attributes
    assert_equal("test_name, 2, 3", @item.to_s())
  end
end
