require 'rails_helper'

describe 'Send invite', type: :request do
  describe 'GET /invite' do
    let!(:user) { create(:user) }

    context 'authorized' do
      before {
        sign_in user
        post '/users'
      }

      it_behaves_like 'status 200'
      it_behaves_like 'success data'
    end

    context 'unauthorized' do
      it 'return 302 status if user unauthorized' do
        post '/users'
        expect(response.status).to eq 302
      end
    end
  end
end