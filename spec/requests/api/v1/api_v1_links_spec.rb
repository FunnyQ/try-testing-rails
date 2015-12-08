require 'rails_helper'

RSpec.describe "Api::V1::Links", type: :request do
  describe "GET /api/v1/links" do
    it "會回傳所有 links, 依讚數排序" do

      # get api_v1_links_index_path
      # expect(response).to have_http_status(200)
      _coldest_link = create(:link)
      hottest_link = create(:link, upvotes: 2, url: '222')

      get '/api/v1/links'

      expect(json_body['links'].count).to eq 2

      hottest_link_json = json_body['links'][0]

      expect(response.status).to eq 200
      expect(hottest_link_json).to eq({
        'id' => hottest_link.id,
        'title' => hottest_link.title,
        'url' => hottest_link.url,
        'upvotes' => hottest_link.upvotes,
        'downvotes' => hottest_link.downvotes,
      })
    end
  end

  describe 'POST /api/v1/links' do
    it '建立新的 link' do
      link_params = attributes_for(:link)

      post '/api/v1/links', link_params

      expect(response.status).to eq 201
      expect(Link.last.title).to eq link_params[:title]
    end

    context '參數有誤的時候' do
      it '回傳 422 與錯誤原因' do
        link_params = attributes_for(:link, :invalid)

        post '/api/v1/links', link_params

        expect(response.status).to eq 422
        expect(json_body.fetch('errors')).not_to be_empty
      end
    end
  end
end
