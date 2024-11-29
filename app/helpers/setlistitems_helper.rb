module SetlistitemsHelper
  def song_display(item)
    # 新訳の場合
    item.song_title = item.is_arranged? ? "新訳：#{item.song_title}" : item.song_title
    # アンコールの場合
    item.song_title = item.is_encore? ? "En. #{item.song_title}" : item.song_title
    # リハーサルの場合
    item.song_title = item.is_rehearsal? ? "（リハ） #{item.song_title}" : item.song_title
    # 楽曲ではない場合
    item.song_title = item.is_song? ? item.song_title : "（#{item.song_title}）"
  end
end
