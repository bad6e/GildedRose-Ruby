require_relative "./common_item_methods"

class Conjured < NormalItem
  include CommonItemsMethods
  attr_accessor :item, :sell_in, :quality

  def initialize(item)
    @item    = item
    @sell_in = item.sell_in
    @quality = item.quality
    check_quality(2, 4)
    lower_sell_in_days_remaining_by_one
  end
end
