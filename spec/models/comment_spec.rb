require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  new_post = Post.create(title: 'My first post', author: User.create(name: 'David'))
  other_user = User.create(name: 'Elson')
  subject { Comment.create(text: 'Hi comment', author: other_user, post: new_post)}

  it 'UpdatesCommentsCounter increments post comment_counter' do
    expect(subject.post.comments_counter).to be 1
    Comment.create(text: 'Hi comment', author: subject.author, post: subject.post)
    expect(subject.post.comments_counter).to be 2
  end
end
