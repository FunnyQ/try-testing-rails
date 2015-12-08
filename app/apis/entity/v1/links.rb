module Entity
  module V1
    class Links < Grape::Entity
      expose :id, :title, :url, :upvotes, :downvotes
    end
  end
end
