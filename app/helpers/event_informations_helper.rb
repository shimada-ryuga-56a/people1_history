module EventInformationsHelper
  def event_information_hint
    "（投稿のヒント）" + ["関係者席に誰かいた？", "楽しかった〜？", "感想教えて！", "覚えてたらライブ前後のBGMについても教えて！", "天気とかどうでした？"].sample
  end
end
