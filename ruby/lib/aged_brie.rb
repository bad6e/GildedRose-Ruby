class AgedBrie < Item
  def initialize(item)
    @item = item
    check_quality(item)
    lower_sell_in_day_by_one(item)
  end

  def check_quality(item)
    if items_sell_in_days_is_positive(item)
      increase_item_quality_by_factor(item, 1) unless item.quality == 50
    else
      increase_item_quality_by_factor(item, 2) unless item.quality == 50
    end
  end
end
