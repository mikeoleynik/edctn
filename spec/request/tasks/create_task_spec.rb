require 'rails_helper'

describe 'Create task', type: :request do
  describe 'POST /task' do
    let!(:user) { create(:user) }
    let!(:theme) { create(:theme) }

    context 'authorized' do
      context 'valid attributes with users' do
        before {
          sign_in user
          post '/tasks', params: { title: Faker::Educator.subject,
                                   body: Faker::Lorem.paragraph,
                                   difficulty: rand(1..10),
                                   theme_id: theme.id,
                                   user_tasks_attributes: [{user_id: user.id}]}
        }

        it_behaves_like 'status 200'

        it 'the task is added to the user' do
          expect(user.tasks).not_to be_empty
        end
      end

      context 'valid attributes with pictures' do
        before {
          sign_in user
          post '/tasks', params: { title: Faker::Educator.subject,
                                   body: Faker::Lorem.paragraph,
                                   difficulty: rand(1..10),
                                   theme_id: theme.id,
                                   picture_attributes: {image: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/images/image.png'), 'image/png')}}
        }

        it_behaves_like 'status 200'

        it 'the picture is added to the task' do
          task = Task.last
          expect(task.picture).to eql(Picture.last)
        end
      end

      context 'valid attributes' do
        before {
          sign_in user
          post '/tasks', params: { title: Faker::Educator.subject,
                                   body: Faker::Lorem.paragraph,
                                   difficulty: rand(1..10),
                                   theme_id: theme.id }
        }

        it_behaves_like 'status 200'
        it_behaves_like 'success data'
      end

      context 'valid attributes with theme' do
        before {
          sign_in user
          post '/tasks', params: { title: Faker::Educator.subject,
                                   body: Faker::Lorem.paragraph,
                                   difficulty: rand(1..10),
                                   nodes_attributes: [{theme_id: theme.id}] }
        }

        it_behaves_like 'status 200'
        it_behaves_like 'success data'
      end

      context 'invalid attributes' do
        before {
          sign_in user
          post '/tasks', params: { title: nil }
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
        post '/tasks'
        expect(response.status).to eq 302
      end
    end
  end
end