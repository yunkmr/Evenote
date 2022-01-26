require 'rails_helper'

RSpec.describe 'Chatモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { chat.valid? }

    let(:user) { create(:user) }
    let(:room) { create(:room) }
    let(:chat) { create(:chat, user_id: user.id, room_id: room.id) }

    context 'メッセージカラム' do
      it '空欄でないこと' do
        chat.message = ''
        is_expected.to eq false
      end
      it '140文字以下であること: 140文字は〇' do
        chat.message = Faker::Lorem.characters(number: 140)
        is_expected.to eq true
      end
      it '140文字以下であること: 141文字は×' do
        chat.message = Faker::Lorem.characters(number: 141)
        is_expected.to eq false
      end
    end
  end

end