require 'rails_helper'

RSpec.feature "使用者可以瀏覽首頁", type: :feature do
  scenario '在首頁可以看到原本就存在的連結' do
    link = create(:link)

    visit root_path

    expect(page).to have_link link.title, href: link.url
  end
end
