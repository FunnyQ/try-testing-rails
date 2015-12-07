require 'rails_helper'

RSpec.describe Link, '#upvote', type: :model do
  it '會增加讚數' do
    link = build(:link, upvotes: 1)

    link.upvote

    expect(link.upvotes).to eq 2
  end
end

RSpec.describe Link, '#score', type: :model do
  it '會顯示正確的分數，(讚 - 噓)' do
    link = build(:link, upvotes: 2, downvotes: 1)

    expect(link.score).to eq 1
  end
end
