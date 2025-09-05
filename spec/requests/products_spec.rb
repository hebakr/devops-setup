require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/products'
      expect(response).to have_http_status(:success)
    end

    it 'returns all products' do
      Product.create(name: 'Product 1', price: 10.0)
      Product.create(name: 'Product 2', price: 20.0)

      get '/products'
      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response[0]['name']).to eq('Product 1')
      expect(json_response[1]['name']).to eq('Product 2')
    end
  end
end
