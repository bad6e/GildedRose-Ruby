require_relative "./common_item_methods"

class NormalItem
  include CommonItemsMethods
  attr_accessor :item, :sell_in, :quality

  def initialize(item)
    @item    = item
    @sell_in = item.sell_in
    @quality = item.quality
  end

  def check_quality
    if items_sell_in_days_is_positive &&
       items_quality_number_is_greater_than_specfic_factor(1)
      decrease_item_quality_by_a_factor_of(1)
    elsif items_sell_in_days_is_zero_or_negative &&
          items_quality_number_is_greater_than_specfic_factor(2)
      decrease_item_quality_by_a_factor_of(2)
    else
      adjust_item_quality_to_zero
    end
    lower_sell_in_days_remaining_by_one
  end

  def items_quality_number_is_greater_than_specfic_factor(factor)
    quality > factor
  end
end
