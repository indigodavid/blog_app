class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  after_save :update_likes_counter

  validates :author, uniqueness: { scope: :post }

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end

  private :update_likes_counter
end
