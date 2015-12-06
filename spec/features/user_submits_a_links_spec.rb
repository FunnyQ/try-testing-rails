require 'rails_helper'

RSpec.feature "user submits a link", type: :feature do
  scenario '使用者可以在頁面上看到剛送出的連結' do
    link_title = "This is awesome!"
    link_url = "http://testing.com"

    visit root_path
    click_on 'submit a new link'
    fill_in 'link_title', with: link_title
    fill_in 'link_url', with: link_url
    click_on 'Submit!'

    expect(page).to have_link link_title, href: link_url
  end
end
