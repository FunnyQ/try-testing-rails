module API
  module V1

    # Link API V1
    class LinkApi < Grape::API
      desc 'get all links'

      get 'links' do
        links = Link.all.hottest_first

        present :links, links, with: Entity::V1::Links
      end
    end
  end
end
