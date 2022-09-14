class User < ApplicationRecord
  has_many :posts, inverse_of: 'author'
  has_many :likes, inverse_of: 'author'
  has_many :comments, inverse_of: 'author'

  def last_three_posts
    Post.where(author: self).order(updated_at: :desc).first(3)
  end
end
