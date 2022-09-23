require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'GET /' do
    before(:each) do
      @user = User.create(name: 'David')
      @id = @user.id
      post = Post.create(title: 'My first post', author: @user, text: 'Text of my first post')
      get "/users/#{@id}/posts/#{post.id}"
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
