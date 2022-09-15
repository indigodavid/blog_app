class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes
  has_many :comments

  after_save :update_posts_counter

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_initialize do |post|
    post.likes_counter = 0
    post.comments_counter = 0
  end

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def five_most_recent_comments
    comments.order(updated_at: :desc).first(5)
  end

  private :update_posts_counter
end
