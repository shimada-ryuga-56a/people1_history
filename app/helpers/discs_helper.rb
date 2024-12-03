module DiscsHelper
  def show_item_title(item)
    item.is_arranged? ? "新訳：" + item.song.name : item.song.name
  end
end
