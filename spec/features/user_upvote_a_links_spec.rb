require 'rails_helper'

RSpec.feature "使用者可以對連結按讚", type: :feature do
  scenario '使用者會看到讚數增加' do
    link = create :link

    visit root_path

    within "#link_#{link.id}" do
      click_on '讚'
    end

    except(page).to have_css "link_#{link.id} [data-role='score']", text: '1'
  end
end
