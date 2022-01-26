require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post.valid? }

    let(:user) { create(:user) }
    let(:post) { create(:post, user_id: user.id) }

    context 'テキストカラム' do
      it '空欄でないこと' do
        post.maintext = ''
        is_expected.to eq false
      end
    end
  end

end