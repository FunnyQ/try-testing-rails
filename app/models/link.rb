class Link < ActiveRecord::Base
  IMAGE_FORMATS = %w(.jpg .png .gif)

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

  def image?
    url.end_with? *IMAGE_FORMATS
  end
end
