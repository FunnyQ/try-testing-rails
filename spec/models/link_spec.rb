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

RSpec.describe Link, '.hottest_first', type: :model do
  it '會按照分數排序' do
    coldest_link = create :link, upvotes: 3, downvotes: 3
    hottest_link = create :link, upvotes: 9, downvotes: 1
    normal_link = create :link, upvotes: 5, downvotes: 2

    expect(Link.hottest_first).to eq [hottest_link, normal_link, coldest_link]
  end
end
