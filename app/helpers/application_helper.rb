module ApplicationHelper
  def default_meta_tags
    {
      site: 'ぴぽの掲示板',
      title: 'PEOPLE 1リスナーの情報交換プラットフォーム',
      reverse: true,
      charset: 'utf-8',
      description: 'PEOPLE 1に関する情報を交換できる、非公式Webサービスです。',
      keywords: 'PEOPLE 1,ぴぽ,Deu',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp_image.png'), # 配置するパスやファイル名によって変更すること
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
        site: '@', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        image: image_url('ogp_image.png') # 配置するパスやファイル名によって変更すること
      }
    }
  end
end
