require 'rails_helper'

RSpec.describe 'Ticketモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { ticket.valid? }

    let(:user) { create(:user) }
    let(:ticket) { create(:ticket, user_id: user.id) }

    context '日付カラム' do
      it '空欄でないこと' do
        ticket.event_date = ''
        is_expected.to eq false
      end
    end

    context 'イベント名カラム' do
      it '空欄でないこと' do
        ticket.event_name = ''
        is_expected.to eq false
      end
    end
  end

end