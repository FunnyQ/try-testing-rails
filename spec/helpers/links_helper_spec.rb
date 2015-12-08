require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the LinksHelper. For example:
#
# describe LinksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe LinksHelper, type: :helper do
  it '同時顯示分數與原始投票狀況' do
    link = Link.new(upvotes: 7, downvotes: 2)
    formatted_score = helper.formatted_score_for(link)

    expect(formatted_score).to eq '5 (+7, -2)'
  end
end
