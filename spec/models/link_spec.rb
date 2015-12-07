require 'rails_helper'

RSpec.describe Link, '#upvote', type: :model do
  it '會增加讚數' do
    link = build(:link, upvotes: 1)

    link.upvote

    expect(link.upvotes).to eq 2
  end
end
