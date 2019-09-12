require 'rails_helper'

describe 'Delete theme', type: :request do
  describe 'DELETE /themes/:id' do
    let!(:user) { create(:user) }
    let!(:theme) { create(:theme) }

    context 'authorized' do
      before {
        sign_in user
        delete "/themes/#{theme.id}"
      }

      it 'return status 204' do
        expect(response.status).to eq 204
      end
    end

    context 'unauthorized' do
      it 'return 401 status if user is not authorized' do
        delete "/themes/#{theme.id}"
        expect(response.status).to eq 302
      end
    end
  end
end