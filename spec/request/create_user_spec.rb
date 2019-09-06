require 'rails_helper'

describe 'Create user', type: :request do
  describe 'POST /users' do
    context 'valid email and password' do
      before { post '/users', params: { email: 'oleynik@ya.ru', password: 'qwerty12' } }

      it 'return status 200' do
        expect(response.status).to eq 200
      end

      it 'success exist in the response' do
        expect(json_response.keys[0]).to match(/success/)
      end
    end

    context 'invalid' do
      before { post '/users', params: { email: 'oleynik@ya.ru', password: 'qwerty' } }
      it 'success exist in the response' do
        expect(json_response.keys[0]).to match(/error/)
      end
    end
  end
end