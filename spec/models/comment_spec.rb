require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Create Post and users to add new comments
  before(:each) do
    new_post = Post.create(title: 'My first post', author: User.create(name: 'David'))
    other_user = User.create(name: 'Elson')
    @comment = Comment.create(text: 'Hi comment', author: other_user, post: new_post)
  end

  it 'UpdatesCommentsCounter increments post comment_counter' do
    expect(@comment.post.comments_counter).to be 1
    Comment.create(text: 'Hi comment', author: @comment.author, post: @comment.post)
    expect(@comment.post.comments_counter).to be 2
  end
end
