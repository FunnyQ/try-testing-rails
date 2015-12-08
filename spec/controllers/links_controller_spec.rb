require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe '#create' do
    context '當連結是 invalid 的時候' do
      it '重新顯示表單' do
        post :create, link: attributes_for(:link, :invalid)

        expect(response).to render_template :new
      end
    end
  end
end
