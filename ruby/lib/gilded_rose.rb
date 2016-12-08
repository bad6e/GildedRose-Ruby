class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      check_item_type(item)
    end
  end

  private

  def check_item_type(item)
    if item_options.include?(item.name)
      route_to_correct_item(item)
    else
      NormalItem.new(item).check_quality
    end
  end

  def route_to_correct_item(item)
    if item.name == "Aged Brie"
      AgedBrie.new(item).check_quality
    elsif item.name == "Sulfuras, Hand of Ragnaros"
      Sulfuras.new(item)
    elsif item.name == "Conjured"
      Conjured.new(item).check_quality
    else
      BackStagePass.new(item).check_sell_in_days_remaining
    end
  end

  def item_options
    [
      "Backstage passes to a TAFKAL80ETC concert",
      "Sulfuras, Hand of Ragnaros",
      "Aged Brie",
      "Conjured"
    ]
  end
end
