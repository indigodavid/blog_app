require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'David')
    @id = @user.id
  end

  describe 'GET /users/:id/posts/' do
    before(:example) { get "/users/#{@id}/posts/" }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in its body' do
      expect(response.body).to include('<h1>Posts</h1>')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/posts/show'
      expect(response).to have_http_status(:success)
    end
  end
end
