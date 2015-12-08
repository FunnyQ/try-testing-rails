require 'rails_helper'

RSpec.describe Link, type: :model do
  describe '#upvote' do
    it '會增加讚數' do
      link = build(:link, upvotes: 1)

      link.upvote

      expect(link.upvotes).to eq 2
    end
  end

  describe '#score' do
    it '會顯示正確的分數，(讚 - 噓)' do
      link = build(:link, upvotes: 2, downvotes: 1)

      expect(link.score).to eq 1
    end
  end

  describe '.hottest_first' do
    it '會按照分數排序' do
      coldest_link = create :link, upvotes: 3, downvotes: 3, url: '111'
      hottest_link = create :link, upvotes: 9, downvotes: 1, url: '222'
      normal_link = create :link, upvotes: 5, downvotes: 2, url: '333'

      expect(Link.hottest_first).to eq [hottest_link, normal_link, coldest_link]
    end
  end

  describe 'validations' do
    it { expect(Link.new).to validate_presence_of(:title) }
    it { expect(subject).to validate_presence_of(:url) }
    it { is_expected.to validate_uniqueness_of(:url) } # using expected_to is more readable
  end
end
