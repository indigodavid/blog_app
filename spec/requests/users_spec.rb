require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /' do
    before(:example) { get '/'}

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in its body' do
      expect(response.body).to include('<h1>Users</h1>')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end
  end
end
