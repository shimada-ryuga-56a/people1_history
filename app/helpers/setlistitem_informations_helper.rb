module SetlistitemInformationsHelper
  def setlistitem_information_hint
    "（投稿のヒント）#{['？ボタンで投稿のヒントが見れます！', 'Itoさんが〇〇って言ってた！等', 'トラブルとかもあったら教えて👂', 'メンバーの発言なども教えてください！', '歌詞変えとかあったら教えて！', '楽しかった〜？',
                        '歌詞間違えてたらこっそり教えて👂'].sample}"
  end
end
