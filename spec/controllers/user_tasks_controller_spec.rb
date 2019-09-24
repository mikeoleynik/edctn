require 'rails_helper'

describe UserTasksController do
  describe 'POST /user_tasks' do
    subject(:json_response) { JSON.parse(response.body) }

    let!(:task) { create(:task) }
    let!(:user) { create(:user) }

    context 'authorized' do
      login_user(:user)

      context 'valid attributes' do
        before {
          post :create, params: { user_id: user.id, task_id: task.id }
        }

        it_behaves_like 'status 200'
        it_behaves_like 'success data'

        it 'the task is added to the user' do
          expect(user.tasks.first).to eq(task)
        end
      end

      context 'invalid attributes' do
        before {
          post :create, params: { user_id: user.id }
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
end