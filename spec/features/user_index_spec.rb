require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'index page' do
    before(:each) do
      @first_photo = 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
      @second_photo = 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80'
      @first_user = User.create(name: 'Tom', photo: @first_photo, bio: 'Teacher from Mexico.')
      @second_user = User.create(name: 'Lilly', photo: @second_photo, bio: 'Teacher from Poland.')
      @third_user = User.create(name: 'David', photo: @first_photo, bio: 'Teacher from Ecuador.')
      @fourth_user = User.create(name: 'Mauro', photo: @first_photo, bio: 'Teacher from Colombia.')
      @first_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my first post')
      @second_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my second post')
      @third_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my third post')
      @fourth_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my fourth post')
      visit root_path
    end
    it 'displays the username of all other users' do
      expect(page).to have_content(@first_user.name)
      expect(page).to have_content(@second_user.name)
      expect(page).to have_content(@third_user.name)
      expect(page).to have_content(@fourth_user.name)
    end
    it 'displays the user\'s profile picture.' do
      expect(page).to have_css("img[src*='#{@first_photo}']")
      expect(page).to have_css("img[src*='#{@second_photo}']")
    end