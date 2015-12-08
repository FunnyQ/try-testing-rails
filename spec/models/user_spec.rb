require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#is_admin?' do
    it '回傳使用者的身份是否為 admin' do
      user = create(:user, role: :admin)

      expect(user.admin?).to eq true
    end
  end
end
