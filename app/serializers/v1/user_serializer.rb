module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :account_name, :fullname, :image_data, :total_like_count, :total_dislike_count, :following_count, :followers_count, :evaluation_point

    def total_like_count
      object.likes_count
    end

    def total_dislike_count
      object.dislikes_count
    end
  end
end