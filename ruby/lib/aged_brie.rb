require_relative "./common_item_methods"

class AgedBrie
  include CommonItemsMethods
  attr_accessor :item, :sell_in, :quality

  def initialize(item)
    @item    = item
    @sell_in = item.sell_in
    @quality = item.quality
  end

  def check_quality
    if quality <= 49 && items_sell_in_days_is_positive
       increase_item_quality_by_a_factor_of(1)
    elsif quality <= 48
      increase_item_quality_by_a_factor_of(2)
    else
      adjust_item_quality_to_fifty
    end
    lower_sell_in_days_remaining_by_one
  end
end
