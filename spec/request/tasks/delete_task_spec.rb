require 'rails_helper'

describe 'Delete task', type: :request do
  describe 'DELETE /tasks/:id' do
    let!(:user) { create(:user) }
    let!(:theme) { create(:theme) }
    let!(:task) { create(:task, theme: theme) }

    context 'authorized' do
      before {
        sign_in user
        delete "/tasks/#{task.id}"
      }

      it 'return status 204' do
        expect(response.status).to eq 204
      end
    end

    context 'unauthorized' do
      it 'return 401 status if user is not authorized' do
        delete "/tasks/#{task.id}"
        expect(response.status).to eq 302
      end
    end
  end
end