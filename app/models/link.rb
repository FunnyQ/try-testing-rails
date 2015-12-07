class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  validates :url, uniqueness: true

  def upvote
    increment!(:upvotes)
  end

  def score
    upvotes - downvotes
  end

  def self.hottest_first
    order('upvotes - downvotes DESC')
  end

end
