require 'rails_helper'

describe 'Update task', type: :request do
  describe 'PATCH /task/:id' do
    let!(:user) { create(:user) }
    let!(:theme) { create(:theme) }
    let!(:task) { create(:task, theme: theme) }

    context 'authorized' do
      context 'valid attributes' do
        before {
          sign_in user
          patch "/tasks/#{task.id}", params: { title: 'Optimization - #1' }
        }

        it_behaves_like 'status 200'
        it_behaves_like 'success data'

        it 'return task with new title' do
          new_title = json_response.dig('data', 'attributes', 'title')
          expect(new_title).to eql('Optimization - #1')
        end
      end

      context 'invalid attributes' do
        before {
          sign_in user
          patch "/tasks/#{task.id}", params: { title: nil }
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
        patch "/tasks/#{task.id}"
        expect(response.status).to eq 302
      end
    end
  end
end