require 'rails_helper'

describe 'Update theme', type: :request do
  describe 'PATCH /themes/:id' do
    let!(:user) { create(:user) }
    let!(:theme) { create(:theme) }

    context 'authorized' do
      context 'valid attributes' do
        before {
          sign_in user
          patch "/themes/#{theme.id}", params: { title: 'Optimization' }
        }

        it 'return status 200' do
          expect(response.status).to eq 200
        end

        it 'return data in the response' do
          expect(json_response).to have_key('data')
        end

        it 'return theme with new title' do
          new_title = json_response.dig('data', 'attributes', 'title')
          expect(new_title).to eql('Optimization')
        end
      end

      context 'invalid attributes' do
        before {
          sign_in user
          patch "/themes/#{theme.id}", params: { title: nil }
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
        patch "/themes/#{theme.id}", params: { title: Faker::Educator.subject }
        expect(response.status).to eq 302
      end
    end
  end
end