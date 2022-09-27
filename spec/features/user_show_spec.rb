require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'index page' do
    before(:each) do
      @new_photo = 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
      @first_user = User.create(name: 'Tom', photo: @new_photo, bio: 'Teacher from Mexico.')
      @second_user = User.create(name: 'Lilly', photo: @new_photo, bio: 'Teacher from Poland.')
      @first_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my first post')
      @second_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my second post')
      @third_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my third post')
      @fourth_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my fourth post')
      visit user_path(@first_user)
    end
  end
end
