require 'rails_helper'

describe UsersController do
  describe 'POST /users' do
    subject(:json_response) { JSON.parse(response.body) }

    context 'authorized' do
      login_user(:user)
      before {
        post :create
      }

      it_behaves_like 'status 200'
      it_behaves_like 'success data'
    end

    context 'unauthorized' do
      it 'return 302 status if user unauthorized' do
        post :create
        expect(response.status).to eq 302
      end
    end
  end
end