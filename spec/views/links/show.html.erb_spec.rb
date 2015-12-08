require 'rails_helper'

RSpec.describe 'links/show.html.erb' do
  context '如果連結是一張圖片' do
    it 'renders the image inline' do
      link = build(:link, url: 'http://testing.com/image.jpg')

      render partial: 'links/link', locals: { link: link }

      expect(rendered).to have_selector "img[src='#{link.url}']"
    end
  end
end
