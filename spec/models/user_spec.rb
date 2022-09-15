require 'rails_helper'

RSpec.describe User, type: :model do
  # Create user

  subject { User.new(name: 'David') }

  it 'should not allow empty name' do
    expect(subject).to be_valid
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be bigger or equal than 0' do
    expect(subject.posts_counter).to be >= 0
    subject.posts_counter = -1
    expect(subject).to_not be_valid
    subject.posts_counter = 1
    expect(subject).to be_valid
  end

  it 'LastThreePosts length should be between 0 and 3' do
    expect(subject.last_three_posts).to be_kind_of Array
    expect(subject.last_three_posts.length).to be_between(0, 3)
  end
end
