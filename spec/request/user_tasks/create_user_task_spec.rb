require 'rails_helper'

describe 'Create user task', type: :request do
  describe 'POST /user_task' do
    let!(:user) { create(:user) }
    let!(:theme) { create(:theme) }
    let!(:task) { create(:task, theme: theme) }

    context 'authorized' do
      context 'valid attributes' do
        before {
          sign_in user
          post '/user_tasks', params: { user_id: user.id, task_id: task.id }
        }

        it 'return status 200' do
          expect(response.status).to eq 200
        end

        it 'return data in the response' do
          expect(json_response).to have_key('data')
        end

        it 'the task is added to the user' do
          expect(user.tasks.first).to eq(task)
        end
      end

      context 'invalid attributes' do
        before {
          sign_in user
          post '/user_tasks', params: { user_id: user.id }
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
        post '/user_tasks'
        expect(response.status).to eq 302
      end
    end
  end
end