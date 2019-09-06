require 'rails_helper'

describe 'Visit to homepage', type: :request do
  describe 'GET /' do
    let!(:user) { create(:user) }
    context 'authorized' do
      before { get '/', headers: { 'Authorization' => get_token(user.email, user.password) } }

      it 'return status 200' do
        expect(response.status).to eq 200
      end

      it 'success exist in the response' do
        expect(json_response['success']).to match(/ok/)
      end
    end

    context 'unauthorized' do
      it 'return 401 status if header Authorization is invalid ' do
        get '/', headers: { 'Authorization' => '123' }
        expect(response.status).to eq 401
      end
    end
  end
end