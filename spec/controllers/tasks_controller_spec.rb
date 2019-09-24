require 'rails_helper'

describe TasksController do
  subject(:json_response) { JSON.parse(response.body) }

  describe 'POST /task' do
    context 'authorized' do
      login_user(:user)

      context 'valid attributes with users' do
        before {
          post :create, params: attributes_for(:task).merge(user_tasks_attributes: [{user_id: @user.id}])
        }

        it_behaves_like 'status 200'

        it 'the task is added to the user' do
          expect(@user.tasks).not_to be_empty
        end
      end

      context 'valid attributes with pictures' do
        subject(:image) { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/image.png'), 'image/png') }

        before {
          post :create, params: attributes_for(:task).merge(picture_attributes: {image: image})
        }

        it_behaves_like 'status 200'

        it 'the picture is added to the task' do
          task = Task.last
          expect(task.picture).to eql(Picture.last)
        end
      end

      context 'valid attributes' do
        before {
          post :create, params: attributes_for(:task)
        }

        it_behaves_like 'status 200'
        it_behaves_like 'success data'
      end

      context 'valid attributes with theme' do
        let(:theme) { create(:theme) }

        before {
          post :create, params: attributes_for(:task).merge(nodes_attributes: [{theme_id: theme.id}])
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
      it 'return 302 status if user is not authorized' do
        post :create
        expect(response.status).to eq 302
      end
    end
  end

  describe 'PATCH /task/:id' do
    let!(:theme) { create(:theme) }
    let!(:task) { create(:task) }

    context 'authorized' do
      login_user(:user)
      context 'valid attributes' do
        before {
          patch :update, params: { title: 'Optimization - #1', id: task.id }
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
          patch :update, params: { title: nil, id: task.id }
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
        patch :update, params: { id: task.id }
        expect(response.status).to eq 302
      end
    end
  end

  describe 'DELETE /tasks/:id' do
    let!(:theme) { create(:theme) }
    let!(:task) { create(:task) }

    context 'authorized' do
      login_user(:user)
      before {
        delete :destroy, params: { id: task.id }
      }

      it 'return status 204' do
        expect(response.status).to eq 204
      end
    end

    context 'unauthorized' do
      it 'return 401 status if user is not authorized' do
        delete :destroy, params: { id: task.id }
        expect(response.status).to eq 302
      end
    end
  end
end