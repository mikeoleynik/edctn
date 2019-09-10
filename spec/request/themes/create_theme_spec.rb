require 'rails_helper'

describe 'Create theme', type: :request do
  describe 'POST /themes' do
    let!(:user) { create(:user) }

    context 'authorized' do
      context 'valid attributes' do
        before {
          sign_in user
          post '/themes', params: { title: Faker::Educator.subject }
        }

        it 'return status 200' do
          expect(response.status).to eq 200
        end

        it 'return data in the response' do
          expect(json_response).to have_key('data')
        end
      end

      context 'invalid attributes' do
        before {
          sign_in user
          post '/themes', params: { title: nil }
        }

        it 'return status 422' do
          expect(response.status).to eq 422
        end

        it 'return errors in the response' do
          expect(json_response).to have_key('errors')
        end
      end
    end

    context 'unauthorized' do
      it 'return 401 status if user is not authorized' do
        post '/themes'
        expect(response.status).to eq 302
      end
    end
  end
end