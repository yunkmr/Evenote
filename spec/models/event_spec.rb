require 'rails_helper'

RSpec.describe 'Eventモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { event.valid? }

    let(:user) { create(:user) }
    let(:event) { create(:event, user_id: user.id) }

    context '日付カラム' do
      it '空欄でないこと' do
        event.date = ''
        is_expected.to eq false
      end
    end

    context 'イベント名カラム' do
      it '空欄でないこと' do
        event.name = ''
        is_expected.to eq false
      end
    end
  end

end