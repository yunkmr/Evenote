require 'rails_helper'

RSpec.describe 'PostCommentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post_comment.valid? }

    let(:user) { create(:user) }
    let(:post) { create(:post, user_id: user.id) }
    let(:post_comment) { create(:post_comment, user_id: user.id, post_id: post.id) }

    context 'コメントカラム' do
      it '空欄でないこと' do
        post_comment.comment = ''
        is_expected.to eq false
      end
      it '2文字以上であること: 1文字は×' do
        post_comment.comment = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '2文字以上であること: 2文字は〇' do
        post_comment.comment = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
    end
  end

end