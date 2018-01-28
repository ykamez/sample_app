require 'rails_helper'

RSpec.describe V1::UsersController, type: :request do
  describe 'GET #me' do
    subject { get url, headers: headers }

    let(:headers) do
      {
        'Content-Type': 'application/json',
        'Uid': @uid,
        'Access-Token': @token,
        'Client': @client
      }
    end
    let(:url) { '/v1/users/me' }
    let(:user) { create(:user) }
    before do
      @auth_headers = user.create_new_auth_token
      @token = @auth_headers['access-token']
      @uid = @auth_headers['uid']
      @client = @auth_headers['client']
    end
    context 'with valid request' do
      context 'when watching hashtags exists' do
        before do
          user
        end

        it 'returns 200 response' do
          subject
          expect(response.status).to eq 200
          assert_schema_conform
        end
      end
    end
  end
end
