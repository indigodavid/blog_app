require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject {Post.create(title: 'My first post', author: User.new(name: 'David'))}

  it 'should not allow empty title' do
    expect(subject).to be_valid
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not exceed 250 characters' do
    expect(subject).to be_valid
    new_title = ''
    251.times do
      new_title.concat('a')
    end
    subject.title = new_title
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should be bigger or equal than 0' do
    expect(subject.comments_counter).to be >= 0
    subject.comments_counter = -1
    expect(subject).to_not be_valid
    subject.comments_counter = 1
    expect(subject).to be_valid
  end

  it 'LikesCounter should be bigger or equal than 0' do
    expect(subject.likes_counter).to be >= 0
    subject.likes_counter = -1
    expect(subject).to_not be_valid
    subject.likes_counter = 1
    expect(subject).to be_valid
  end

  it 'UpdatePostsCounter to increase on new posts' do
    expect(subject.author.posts_counter).to be 1
    Post.create(title: 'My second post', author: subject.author)
    expect(subject.author.posts_counter).to be 2
  end

  it 'FiveMostRecentComments length should be between 0 and 5' do
    expect(subject.five_most_recent_comments).to be_kind_of Array
    expect(subject.five_most_recent_comments.length).to be_between(0, 5)
  end
end
