require 'rails_helper'

RSpec.describe 'ExBumpPrevention API', type: :request do
  # initialize test data
  let!(:users) { create_list(:user, 10) }
  let(:user_myUUID) { todos.first.myUUID }

  #
  describe 'POST /users/host' do
    let(:valid_attributes) {{ myUUID: "something" }}
    # 유효할 때
    context 'when the request is valid' do
      before { post '/users/host', params: valid_attributes }
      it 'creates a user' do
        expect(json['title']).to eq("something")
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    # 유효하지 않을 때
    context 'when the request is invalid' do
      before { post '/users/host', params: { title: 'something2' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end
end
