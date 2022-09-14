class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def self.update_posts_counter(user)
    user.posts_counter = Post.where(author: user).count
  end

  def five_most_recent_comments(post = self)
    post.comments.order(updated_at: :desc).first(5)
  end
end
