require 'rails_helper'

RSpec.describe "VUTTR API", type: :request do

  let(:user) { create(:user) }
  let!(:tools) { create_list(:tool, 30, created_by: user.id) }
  let(:tool_id) { tools.first.id }

  let(:headers) { valid_headers }

  describe "GET /api/v1/tools" do

    before { get '/api/v1/tools', params: {}, headers: headers }

    it "list all registered tools" do
      expect(json).not_to be_empty
      expect(json.size).to eq(30)
    end

    it 'has status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/tools/:id' do

    before { get "/api/v1/tools/#{tool_id}", params: {}, headers: headers }

    context 'when the tool exists' do
      it 'return the tool' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(tool_id)
      end

      it 'has status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the tool does not exists' do
      let(:tool_id) { 120 }

      it 'has status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find Tool with 'id'=#{tool_id}/)
      end
    end
  end

  describe 'GET /api/v1/tools?tag={name}' do

    context 'when tag is found' do

      before { get '/api/v1/tools?tag=node', headers: headers }

      it 'returns tools tagged with this tag' do
        expect(json).not_to be_empty
        json.collect { |content| expect(content['tags']).to include("node")  }
      end

      it 'responds with status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when tag is not found' do

      before { get '/api/v1/tools?tag=bla', headers: headers }

      it 'responds with status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'body response is empty' do
        expect(json).to be_empty
      end
    end
  end

  describe 'POST /api/v1/tools' do

    let(:valid_attributes) do
      {
        title: 'notebook', link: 'https://example.com',
        description: 'Local app manager. Start apps within your browser, developer tool with local
                        .localhost domain and https out of the box.',
        tags: ['electronic', 'organizing', 'computer', 'developer', 'node'],
        created_by: user.id.to_s
      }.to_json
    end

    context 'when the request is valid' do
      before { post '/api/v1/tools', params: valid_attributes, headers: headers }

      it 'creates a tool' do
        expect(json['title']).to eq('notebook')
      end

      it 'has status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'has a content type JSON' do
        expect(response.content_type).to eq("application/json")
      end
    end

    context 'when the request is invalid' do

      let(:invalid_attributes) do
        {
          title: 'notebook',
          created_by: user.id.to_s
        }.to_json
      end

      before { post '/api/v1/tools', params: invalid_attributes, headers: headers }

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Link can't be blank, Description can't be blank, Tags can't be blank/)
      end

      it 'has status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /api/v1/tools/:id' do

    let(:valid_attributes) { { title: 'Lorem' }.to_json }

    context 'when the record exists' do
      before { put "/api/v1/tools/#{tool_id}", params: valid_attributes, headers: headers }

      it 'has status code 204 if updates the record' do
        expect(response.body).to be_empty
        expect(response).to have_http_status(204)
      end
    end

    context 'when the tool does not exists' do
      let(:tool_id) { 120 }
      before { put "/api/v1/tools/#{tool_id}", params: valid_attributes.to_json, headers: headers }

      it 'has status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find Tool with 'id'=#{tool_id}/)
      end
    end
  end

  describe 'DELETE /api/v1/tools/:id' do

    before { delete "/api/v1/tools/#{tool_id}", params: {}, headers: headers }

    context 'when the tool exists' do
      it 'has status code 204 if delete a tool' do
        expect(response).to have_http_status(204)
      end

      it 'body response is empty' do
        expect(response.body).to be_empty
      end
    end

    context 'when the tool does not exists' do
      let(:tool_id) { 120 }

      it 'has status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'return a not found message' do
        expect(response.body).to match(/Couldn't find Tool with 'id'=#{tool_id}/)
      end
    end
  end
end
