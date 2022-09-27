require 'rails_helper'

RSpec.describe Post, type: :system do
  describe 'index page' do
    before(:each) do
      @new_photo = 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
      @first_user = User.create(name: 'Tom', photo: @new_photo, bio: 'Teacher from Mexico.')
      @second_user = User.create(name: 'Lilly', photo: @new_photo, bio: 'Teacher from Poland.')
      @first_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my first post')
      @second_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my second post')
      @third_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my third post')
      @fourth_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my fourth post')
      @first_comment = Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom! First comment')
      @second_comment = Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom! Second comment')
      Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom! Third comment')
      Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom! Fourth comment')
      Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom! Fifth comment')
      Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom! Sixth comment')
      Like.create(author: @first_user, post: @first_post)
      Like.create(author: @second_user, post: @first_post)
      visit user_posts_path(@first_user.id)
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

    it 'displays a post\'s title.' do
      expect(page).to have_content(@first_post.title)
    end

    it 'displays some of the post\'s body.' do
      expect(page).to have_content(@first_post.text)
    end

    it 'displays the first comments on a post.' do
      expect(page).to have_content(@second_comment.text)
      expect(page).to_not have_content(@first_comment.text)
    end

    it 'displays how many comments a post has.' do
      expect(page).to have_content("Comments: #{@first_post.comments_counter}")
    end

    it 'displays how many likes a post has.' do
      expect(page).to have_content("Likes: #{@first_post.likes_counter}")
    end

    it 'displays a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_button('Pagination')
    end

    it 'when a post is clicked, it redirects to that post\'s show page.' do
      click_link("postlink-#{@first_post.id}")
      expect(page).to have_current_path(user_post_path(@first_user, @first_post))
    end
  end
end
