require_relative "./common_item_methods"
require 'pry'
class NormalItem
  include CommonItemsMethods
  attr_accessor :item, :sell_in, :quality

  def initialize(item)
    @item    = item
    @sell_in = item.sell_in
    @quality = item.quality
    check_quality(1, 2)
    lower_sell_in_days_remaining_by_one
  end

  def check_quality(adj_amt_one, adj_amt_two)
    if items_sell_in_days_is_positive &&
       items_current_quality_is_greater_than_proposed_quality_adjustment(adj_amt_one)
      decrease_item_quality_by_a_factor_of(adj_amt_one)
    elsif items_sell_in_days_is_zero_or_negative &&
          items_current_quality_is_greater_than_proposed_quality_adjustment(adj_amt_two)
      decrease_item_quality_by_a_factor_of(adj_amt_two)
    else
      adjust_item_quality_to_zero
    end
  end

  def items_current_quality_is_greater_than_proposed_quality_adjustment(adjustment_amt)
    quality > adjustment_amt
  end
end
