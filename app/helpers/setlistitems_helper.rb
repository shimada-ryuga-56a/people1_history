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

  def setlistitem_information_hint
    "（投稿のヒント）" + ["？ボタンで投稿のヒントが見れます！", "Itoさんが〇〇って言ってた！等", "トラブルとかもあったら教えて👂", "メンバーの発言なども教えてください！", "歌詞変えとかあったら教えて！", "楽しかった〜？", "歌詞間違えてたらこっそり教えて👂"].sample
  end
end
