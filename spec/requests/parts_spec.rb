# spec/requests/parts_spec.rb
require 'rails_helper'

RSpec.describe 'Parts API', type: :request do
  # initialize test data 
  let!(:parts) { create_list(:part, 10) }
  let(:part_id) { parts.first.id }

  # Test suite for GET /parts
  describe 'GET /parts' do
    # make HTTP get request before each example
    before { get '/parts' }

    it 'returns parts' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /parts/:id
  describe 'GET /parts/:id' do
    before { get "/parts/#{part_id}" }

    context 'when the record exists' do
      it 'returns the part' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(part_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:part_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Part/)
      end
    end
  end

  # Test suite for POST /parts
  describe 'POST /parts' do
    # valid payload
    let(:valid_attributes) { { name: 'tabley boi', number: '1' } }

    context 'when the request is valid' do
      before { post '/parts', params: valid_attributes }

      it 'creates a part' do
        expect(json['name']).to eq('tabley boi')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/parts', params: { title: 'bad part' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to include("Number can't be blank")
      end
    end
  end

  # Test suite for PUT /parts/:id
  describe 'PUT /parts/:id' do
    let(:valid_attributes) { { name: 'chair head' } }

    context 'when the record exists' do
      before { put "/parts/#{part_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /parts/:id
  describe 'DELETE /parts/:id' do
    before { delete "/parts/#{part_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end