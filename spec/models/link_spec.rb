require 'rails_helper'

link_prefixes = %w[https://www.youtube.com/watch?v= https://www.tiktok.com/]

RSpec.describe Link, type: :model do
  describe '正常系: バリデーション' do
    context 'すべての属性が正しく設定されている場合' do
      it 'リンクが作成される' do
        link = create(:link)
        expect(link).to be_valid
        expect(link.errors).to be_empty
      end
    end
  end

  describe '正常系: 独自メソッド' do
    context 'YouTubeのリンクの場合' do
      it 'YouTubeのリンクが正しく判定される' do
        link = create(:link_youtube, url_link: "#{link_prefixes[0]}abcdefg")
        expect(link.extract_youtube_id).to eq 'abcdefg'
      end
    end
  end

  describe '異常系: バリデーション' do
    it { is_expected.to validate_presence_of :platform }
    it { is_expected.to validate_presence_of :url_link }
    it { is_expected.to validate_presence_of :remark }
  end
end
