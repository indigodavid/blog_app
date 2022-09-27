require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'show page' do
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

    it 'displays the user\'s profile picture.' do
      expect(page).to have_css("img[src*='#{@new_photo}']")
    end

    it 'displays the user\'s username.' do
      expect(page).to have_content(@first_user.name)
    end

    it 'displays the number of posts the user has written.' do
      expect(page).to have_content("Number of Posts: #{@first_user.posts_counter}")
    end

    it 'displays the user\'s bio' do
      expect(page).to have_content(@first_user.bio)
    end

    it 'displays the user\'s first three posts' do
      expect(page).to have_content(@second_post.text)
      expect(page).to_not have_content(@first_post.text)
    end

    it 'displays a button that lets visitor view all of a user\'s posts' do
      expect(page).to have_link('See all posts')
    end

    it 'when a user\'s post is clicked, it redirects to that post\'s show page.' do
      click_link("postlink-#{@third_post.id}")
      expect(page).to have_current_path(user_post_path(@first_user, @third_post))
    end

    it 'when See all posts clicked, it redirects to the user\'s post\'s index page' do
      click_link_or_button('See all posts')
      expect(page).to have_current_path(user_posts_path(@first_user))
    end
  end
end
