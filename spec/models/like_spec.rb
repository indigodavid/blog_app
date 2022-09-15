require 'rails_helper'

RSpec.describe Like, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  new_post = Post.create(title: 'My first post', author: User.create(name: 'David'))
  other_user = User.create(name: 'Elson')
  subject { Like.create(author: other_user, post: new_post)}

  it 'UpdatesLikesCounter increments post likes_counter' do
    expect(subject.post.likes_counter).to be 1
    Like.create(author: subject.author, post: subject.post)
    expect(subject.post.likes_counter).to be 2
  end
end
