require 'rails_helper'

describe 'Send invite', type: :request do
  describe 'GET /invite' do
    let!(:user) { create(:user) }

    context 'authorized' do
      before {
        sign_in user
        post '/users'
      }

      it 'return status 200' do
        expect(response.status).to eq 200
      end

      it 'success exist in the response' do
        expect(json_response['success']).to match(/invite sent/)
      end
    end

    context 'unauthorized' do
      it 'return 401 status if header Authorization is invalid ' do
        post '/users'
        expect(response.status).to eq 302
      end
    end
  end
end