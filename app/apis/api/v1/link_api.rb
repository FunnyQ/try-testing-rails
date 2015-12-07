module API
  module V1

    # Link API V1
    class LinkApi < Grape::API
      namespace :links do
        desc 'get all links'

        get do
          links = Link.all.hottest_first

          present :links, links, with: Entity::V1::Links
        end

        desc 'post a new link'

        params do
          requires :title, type: String, desc: 'Title for link'
          requires :url, type: String, desc: 'Link url'
        end

        post do
          new_link = Link.new(title: params[:title], url: params[:url])
          if new_link.save
            present :status, 'OK'
            present :link, new_link
          else
            error!( { status: 422, errors: new_link.errors.messages }, 422)
          end
        end
      end
    end
  end
end
