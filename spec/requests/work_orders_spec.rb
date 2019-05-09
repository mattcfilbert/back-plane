# spec/requests/work_orders_spec.rb
require 'rails_helper'

RSpec.describe 'WorkOrders API', type: :request do
  # initialize test data 
  let!(:work_orders) { create_list(:work_order, 10) }
  let(:work_order_id) { work_orders.first.id }

  # Test suite for GET /work_orders
  describe 'GET /work_orders' do
    # make HTTP get request before each example
    before { get '/work_orders' }

    it 'returns work_orders' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /work_orders/:id
  describe 'GET /work_orders/:id' do
    before { get "/work_orders/#{work_order_id}" }

    context 'when the record exists' do
      it 'returns the work_order' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(work_order_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:work_order_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find WorkOrder/)
      end
    end
  end

  # Test suite for POST /work_orders
  describe 'POST /work_orders' do
    # valid payload
    let(:valid_attributes) { { work_order_number: '1', customer: 'bob', customer_order_number: '123', status: 'In Progress' } }

    context 'when the request is valid' do
      before { post '/work_orders', params: valid_attributes }

      it 'creates a work_order' do
        expect(json['work_order_number']).to eq('1')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/work_orders', params: { customer: 'bad customer' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to include("Status can't be blank")
      end
    end
  end

  # Test suite for PUT /work_orders/:id
  describe 'PUT /work_orders/:id' do
    let(:valid_attributes) { { status: 'chairing' } }

    context 'when the record exists' do
      before { put "/work_orders/#{work_order_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /work_orders/:id
  describe 'DELETE /work_orders/:id' do
    before { delete "/work_orders/#{work_order_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end