module Discs::InformationsHelper
  def disc_information_hint
    "（投稿のヒント）#{['メンバーが話してたエピソードとかを教えてください！', 'ライブのMCとかで話してたエピソードあれば教えてください！', 'メンバーがSNSでこの作品について触れてたら教えてください！',
                        'インタビューで話されてたエピソードなども教えてください！'].sample}"
  end
end
