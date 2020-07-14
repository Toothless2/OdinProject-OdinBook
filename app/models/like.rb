class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post

    def self.likePost(user_id, post_id)
        if Like.where(user: user_id, post: post_id).exists?
            Like.where(user: User.find(user_id), post: Post.find(post_id)).destroy_all
        else
            Like.create(user: User.find(user_id), post: Post.find(post_id))
        end
    end
end
