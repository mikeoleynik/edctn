require 'rails_helper'

describe ThemesController do
  subject(:json_response) { JSON.parse(response.body) }

  describe 'POST /themes' do
    let!(:task) { create(:task) }

    context 'authorized' do
      login_user(:user)
      context 'valid attributes' do
        before {
          post :create, params: { title: Faker::Educator.subject }
        }

        it_behaves_like 'status 200'
        it_behaves_like 'success data'
      end

      context 'valid attributes with tasks' do
        before {
          post :create, params: { title: Faker::Educator.subject,
                                    nodes_attributes: [{task_id: task.id}] }
        }

        it_behaves_like 'status 200'
        it_behaves_like 'success data'
      end

      context 'invalid attributes' do
        before {
          post :create, params: { title: nil }
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
        post :create
        expect(response.status).to eq 302
      end
    end
  end

  describe 'PATCH /themes/:id' do
    let!(:theme) { create(:theme) }
    let!(:task) { create(:task) }

    context 'authorized' do
      login_user(:user)

      context 'valid attributes' do
        before {
          patch :update, params: { title: 'Optimization', id: theme.id }
        }

        it_behaves_like 'status 200'
        it_behaves_like 'success data'

        it 'return theme with new title' do
          new_title = json_response.dig('data', 'attributes', 'title')
          expect(new_title).to eql('Optimization')
        end
      end

      context 'valid attributes with tasks' do
        before {
          patch :update, params: { title: 'Optimization',
                                   nodes_attributes: [{task_id: task.id}],
                                   id: theme.id}
        }

        it_behaves_like 'status 200'
        it_behaves_like 'success data'
      end

      context 'invalid attributes' do
        before {
          patch :update, params: { title: nil, id: theme.id }
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
        patch :update, params: { title: Faker::Educator.subject, id: theme.id }
        expect(response.status).to eq 302
      end
    end
  end

  describe 'DELETE /themes/:id' do
    let!(:theme) { create(:theme) }

    context 'authorized' do
      login_user(:user)
      before {
        delete :destroy, params: { id: theme.id }
      }

      it 'return status 204' do
        expect(response.status).to eq 204
      end
    end

    context 'unauthorized' do
      it 'return 401 status if user is not authorized' do
        delete :destroy, params: { id: theme.id }
        expect(response.status).to eq 302
      end
    end
  end
end