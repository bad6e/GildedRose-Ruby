require_relative "./common_item_methods"

class BackStagePass
  include CommonItemsMethods
  attr_accessor :item, :sell_in, :quality

  def initialize(item)
    @item    = item
    @sell_in = item.sell_in
    @quality = item.quality
    check_sell_in_days_remaining
    lower_sell_in_days_remaining_by_one
  end

  def check_sell_in_days_remaining
    if sell_in > 10
      check_current_quality_number_against_quality_limit(1)
    elsif sell_in > 5 && sell_in <= 10
      check_current_quality_number_against_quality_limit(2)
    elsif sell_in > 0 && sell_in <= 5
      check_current_quality_number_against_quality_limit(3)
    else
      adjust_item_quality_to_zero
    end
  end

  def check_current_quality_number_against_quality_limit(factor)
    if quality <= 50 - factor
      increase_item_quality_by_a_factor_of(factor)
    else
      adjust_item_quality_to_fifty
    end
  end
end
