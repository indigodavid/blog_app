require 'rails_helper'

RSpec.describe Post, type: :system do
  describe 'index page' do
    before(:each) do
      @new_photo = 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
      @first_user = User.create(name: 'Tom', photo: @new_photo, bio: 'Teacher from Mexico.')
      @second_user = User.create(name: 'Lilly', photo: @new_photo, bio: 'Teacher from Poland.')
      @first_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my first post')
      @first_comment = Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom! First comment')
      @second_comment = Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom! Second comment')
      Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom! Third comment')
      Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom! Fourth comment')
      Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom! Fifth comment')
      @last_comment = Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom! Sixth comment')
      Like.create(author: @first_user, post: @first_post)
      Like.create(author: @second_user, post: @first_post)
      visit user_post_path(@first_user, @first_post)
    end

    
  end
end
