class GenericItem < Item
  def initialize(item)
    @item = item
    check_quality(item)
    lower_sell_in_day_by_one(item)
  end

  def lower_sell_in_day_by_one(item)
    item.sell_in -= 1
  end

  def check_quality(item)
    if items_sell_in_days_is_positive(item) &&
       items_quality_is_greater_than_specfic_factor(item, 1)
      decrease_item_quality_by_factor(item, 1)
    elsif items_sell_in_days_is_zero_or_negative(item) &&
          items_quality_is_greater_than_specfic_factor(item, 2)
      decrease_item_quality_by_factor(item, 2)
    else
      adjust_item_quality_to_zero(item)
    end
  end

  def items_sell_in_days_is_positive(item)
    item.sell_in > 0
  end

  def items_sell_in_days_is_zero_or_negative(item)
    item.sell_in <= 0
  end

  def items_quality_is_greater_than_specfic_factor(item, factor)
    item.quality > factor
  end
end
