class GildedRose
  attr_accessor :items

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      check_type_of_item_and_call(item)
    end
  end

  private

  def check_type_of_item_and_call(item)
    return AgedBrie.new(item) if item.name == "Aged Brie"
    return Sulfuras.new(item) if item.name == "Sulfuras, Hand of Ragnaros"
    return Conjured.new(item) if item.name == "Conjured"
    return BackStagePass.new(item) if item.name == "Backstage passes to a TAFKAL80ETC concert"
    NormalItem.new(item)
  end
end
