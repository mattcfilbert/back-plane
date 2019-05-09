require 'rails_helper'

RSpec.describe 'PartOperations API' do
  # Initialize the test data
  let!(:part) { create(:part) }
  let!(:part_operations) { create_list(:part_operation, 20, part_id: part.id) }
  let(:part_id) { part.id }
  let(:id) { part_operations.first.id }

  # Test suite for GET /parts/:part_id/part_operations
  describe 'GET /parts/:part_id/part_operations' do
    before { get "/parts/#{part_id}/part_operations" }

    context 'when part exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all part part_operations' do
        expect(json.size).to eq(20)
      end
    end

    context 'when part does not exist' do
      let(:part_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Part")
      end
    end
  end

  # Test suite for GET /parts/:part_id/part_operations/:id
  describe 'GET /parts/:part_id/part_operations/:id' do
    before { get "/parts/#{part_id}/part_operations/#{id}" }

    context 'when part part_operation exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the part_operation' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when part part_operation does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find PartOperation")
      end
    end
  end

  # Test suite for PUT /parts/:part_id/part_operations
  describe 'POST /parts/:part_id/part_operations' do
    let(:valid_attributes) { { name: 'build the table leg', number: '1' } }

    context 'when request attributes are valid' do
      before { post "/parts/#{part_id}/part_operations", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/parts/#{part_id}/part_operations", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to include("Name can't be blank")
      end
    end
  end

  # Test suite for PUT /parts/:part_id/part_operations/:id
  describe 'PUT /parts/:part_id/part_operations/:id' do
    let(:valid_attributes) { { name: 'tablestuff' } }

    before { put "/parts/#{part_id}/part_operations/#{id}", params: valid_attributes }

    context 'when part_operation exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the part_operation' do
        updated_part_operation = PartOperation.find(id)
        expect(updated_part_operation.name).to match(/tablestuff/)
      end
    end

    context 'when the part_operation does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find PartOperation")
      end
    end
  end

  # Test suite for DELETE /parts/:id
  describe 'DELETE /parts/:id' do
    before { delete "/parts/#{part_id}/part_operations/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end