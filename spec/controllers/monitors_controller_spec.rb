require 'rails_helper'

RSpec.describe MonitorsController, type: :controller do
  describe 'GET #lb' do
    it 'responds successfully with an HTTP 200 OK' do
      get :lb
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
