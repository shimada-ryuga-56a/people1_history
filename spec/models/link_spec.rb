require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'バリデーションチェック' do
    it "設定したすべてのバリデーションが機能しているか" do
      link = create(:link)
      expect(link).to be_valid
      expect(link.errors).to be_empty
    end
  end
end
