module DiscsHelper
  def show_item_title(item)
    item.is_arranged? ? item.position.to_s + ". 新訳：" + item.song.name : item.position.to_s + ". " + item.song.name
  end
end
