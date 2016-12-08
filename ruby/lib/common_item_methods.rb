module CommonItemsMethods
  def items_sell_in_days_is_positive
    sell_in > 0
  end

  def items_sell_in_days_is_zero_or_negative
    sell_in <= 0
  end

  def decrease_item_quality_by_a_factor_of(factor)
    item.quality -= factor
  end

  def increase_item_quality_by_a_factor_of(factor)
    item.quality += factor
  end

  def adjust_item_quality_to_zero
    item.quality = 0
  end

  def adjust_item_quality_to_fifty
    item.quality = 50
  end

  def lower_sell_in_days_remaining_by_one
    item.sell_in -= 1
  end
end
