require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /login' do
    let!(:user) { create(:user) }

    context 'authorized' do
      before { post '/login', params: { email: user.email, password: user.password } }

      it 'return 200 status' do
        expect(response.status).to eq 200
      end

      it 'response contains auth_token' do
        expect(json_response.keys[0]).to match(/auth_token/)
      end
    end

    context 'unauthorized' do
      it 'return 401 status if there is invalid authentication data' do
        post '/login', params: { email: user.email, password: "123" }
        expect(response.status).to eq 401
      end

      it 'return 401 status if there is no authentication data' do
        post '/login'
        expect(response.status).to eq 401
      end

      it 'return 401 status if go to page without token' do
        get '/'
        expect(response.status).to eq 401
      end
    end
  end
end