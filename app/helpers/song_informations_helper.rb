module SongInformationsHelper
  def song_information_hint
    "（投稿のヒント）" + ["メンバーが話してたエピソードとかを教えて！", "ライブのMCとかで話してたエピソードあれば教えてください！", "メンバーがSNSでこの曲に触れてたら教えてください！", "インタビューで話されてたエピソードなども教えてください！"].sample
  end
end
