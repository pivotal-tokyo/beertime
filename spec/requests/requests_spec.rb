require 'rails_helper'

RSpec.describe 'Requests', type: :request do
  describe 'GET /requests/new' do
    it 'renders list of beers' do
      allow(Beer).to receive(:all).and_return(
        OpenStruct.new(
          name: 'Hitachino',
          url: 'http://example.com'
        )
      )

      env = {
        HTTP_AUTHORIZATION: ActionController::HttpAuthentication::Basic.encode_credentials(
          ENV['HTTP_BASIC_AUTH_USERNAME'],
          ENV['HTTP_BASIC_AUTH_PASSWORD']
        )
      }

      get new_request_path, env: env

      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end
end
