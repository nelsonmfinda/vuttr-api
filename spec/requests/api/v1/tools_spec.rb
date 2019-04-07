require 'rails_helper'

RSpec.describe "VUTTR API", type: :request do

  let!(:tools) { create_list(:tool, 30) }
  let(:tool_id) { tools.first.id }

  describe "GET /api/v1/tools" do

    before { get '/api/v1/tools' }

    it "list all registered tools" do
      expect(json).not_to be_empty
      expect(json.size).to eq(30)
    end

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/tools/:id' do

    before { get "/api/v1/tools/#{tool_id}" }

    context 'when the tool exists' do
      it 'return the tool' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(tool_id)
      end

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the tool does not exists' do
      let(:tool_id) { 120 }

      it 'return status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find Tool with 'id'=#{tool_id}/)
      end
    end
  end

  describe 'GET /api/v1/tools?tag={name}' do

    before { get '/api/v1/tools?tag=node' }

    context 'when searching a tool by tag ' do
      it 'returns tools tagged with this tag' do
        expect(json).not_to be_empty

        json.each do |content|
          expect(content['tags']).to include("node")
        end
      end
    end
  end

  describe 'POST /api/v1/tools' do

    let(:valid_attributes) {
      {
        title: 'notebook', link: 'https://example.com',
        description: 'Local app manager. Start apps within your browser, developer tool with local
                        .localhost domain and https out of the box.',
        tags: ['electronic', 'organizing', 'computer', 'developer', 'node']
      }
    }

    context 'when the request is valid' do
      before { post '/api/v1/tools', params: valid_attributes }

      it 'creates a tool' do
        expect(json['title']).to eq('notebook')
      end

      it 'return status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/tools', params: { title: 'Lorem' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Link can't be blank, Description can't be blank, Tags can't be blank/)
      end
    end
  end

  describe 'PUT /api/v1/tools/:id' do

    let(:valid_attributes) { { title: 'Lorem' } }

    context 'when the record exists' do
      before { put "/api/v1/tools/#{tool_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /api/v1/tools/:id' do

    before { delete "/api/v1/tools/#{tool_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
