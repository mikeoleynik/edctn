require 'rails_helper'

describe 'Visit to homepage', type: :request do
  describe 'GET /' do
    let!(:user) { create(:user) }
    context 'authorized' do
      before {
        sign_in user
        get '/'
      }

      it 'return status 200' do
        expect(response.status).to eq 200
      end

      it 'success exist in the response' do
        expect(json_response['success']).to match(/ok/)
      end
    end

    context 'unauthorized' do
      it 'return 401 status if header Authorization is invalid ' do
        get '/'
        expect(response.status).to eq 302
      end
    end
  end
end