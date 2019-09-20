require 'rails_helper'

describe 'Create theme', type: :request do
  describe 'POST /themes' do
    let!(:user) { create(:user) }
    let!(:task) { create(:task) }

    context 'authorized' do
      context 'valid attributes' do
        before {
          sign_in user
          post '/themes', params: { title: Faker::Educator.subject }
        }

        it_behaves_like 'status 200'
        it_behaves_like 'success data'
      end

      context 'valid attributes with tasks' do
        before {
          sign_in user
          post '/themes', params: { title: Faker::Educator.subject,
                                    nodes_attributes: [{task_id: task.id}] }
        }

        it_behaves_like 'status 200'
        it_behaves_like 'success data'
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
          expect(json_response).to have_jsonapi_errors
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