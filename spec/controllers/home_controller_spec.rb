require 'rails_helper'

describe HomeController do
  describe 'GET /' do


    subject(:json_response) { JSON.parse(response.body) }

    context 'authorized' do
      login_user(:user)
      before { get :homepage }

      it 'return status 200' do
        expect(response.status).to eq 200
      end

      it 'success exist in the response' do
        expect(json_response['success']).to match(/ok/)
      end
    end

    context 'unauthorized' do
      it 'return 302 status if user unauthorized' do
        get :homepage
        expect(response.status).to eq 302
      end
    end
  end
end