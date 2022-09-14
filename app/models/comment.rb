class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_comments_counter(post)
    post.comments_counter = Comment.where(post:).count
  end
end
