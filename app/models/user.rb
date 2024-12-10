class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]

  has_many :setlists, dependent: :destroy
  has_many :setlistitem_informations, dependent: :destroy
  has_many :song_informations, dependent: :destroy
  has_many :likes_on_song_informations, dependent: :destroy
  has_many :likes_on_tour_informations, dependent: :destroy
  has_many :likes_on_event_informations, dependent: :destroy
  has_many :likes_on_setlistitem_informations, dependent: :destroy
  has_many :notices, dependent: :destroy
  has_many :event_bookmarks, dependent: :destroy

  # Twitter認証ログイン用
  # ユーザーの情報があれば探し、無ければ作成する
  def self.find_for_oauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)

    unless user
      name = auth[:info][:name]
      image_url = auth[:info][:image]
      image = URI.parse(image_url) # パースする必要がある
      user = User.create!(
        uid: auth.uid,
        provider: auth.provider,
        name: name,
        image: image,
        email: User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  # ダミーのメールアドレスを作成
  def self.dummy_email(auth)
    "#{Time.now.strftime('%Y%m%d%H%M%S').to_i}-#{auth.uid}-#{auth.provider}@example.com"
  end
end
