require 'rails_helper'

RSpec.describe 'Albumモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { album.valid? }

    let(:user) { create(:user) }
    let(:event) { create(:event, user_id: user.id) }
    let(:album) { create(:album, user_id: user.id, event_id: event.id) }

    context 'アルバム名カラム' do
      it '空欄でないこと' do
        album.album_name = ''
        is_expected.to eq false
      end
    end
  end

end