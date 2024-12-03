module DiscsHelper
  def show_item_title(item)
    item.is_arranged? ? "#{item.position}. 新訳：#{item.song.name}" : "#{item.position}. #{item.song.name}"
  end
end
