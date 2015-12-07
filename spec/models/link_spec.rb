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
    coldest_link = create :link, upvotes: 3, downvotes: 3, url: '111'
    hottest_link = create :link, upvotes: 9, downvotes: 1, url: '222'
    normal_link = create :link, upvotes: 5, downvotes: 2, url: '333'

    expect(Link.hottest_first).to eq [hottest_link, normal_link, coldest_link]
  end
end

RSpec.describe Link, "validations" do
  it { expect(Link.new).to validate_presence_of(:title) }
  it { expect(subject).to validate_presence_of(:url) }
  it { is_expected.to validate_uniqueness_of(:url) } # using expected_to is more readable
end
