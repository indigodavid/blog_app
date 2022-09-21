class AddDefaultValueToCounters < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :posts_counter, 0)
    change_column_default(:posts, :likes_counter, 0)
    change_column_default(:posts, :comments_counter, 0)
  end
end
