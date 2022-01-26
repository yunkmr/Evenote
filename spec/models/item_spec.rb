require 'rails_helper'

RSpec.describe 'Itemモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { item.valid? }

    let(:user) { create(:user) }
    let(:event) { create(:event, user_id: user.id) }
    let(:item) { create(:item, event_id: event.id) }

    context 'アイテム名カラム' do
      it '空欄でないこと' do
        item.name = ''
        is_expected.to eq false
      end
    end

    context '個数カラム' do
      it '空欄でないこと' do
        item.quantity = ''
        is_expected.to eq false
      end
    end
        context '金額カラム' do
      it '空欄でないこと' do
        item.price = ''
        is_expected.to eq false
      end
    end

  end

end