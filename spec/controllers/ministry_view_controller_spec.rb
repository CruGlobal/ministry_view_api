require 'rails_helper'
require 'webmock/rspec'
require 'savon/mock/spec_helper'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.describe MinistryViewController, type: :controller do
  include Savon::SpecHelper

  before(:all) { savon.mock! }
  after(:all) { savon.unmock! }

  describe 'GET #countries' do
    before do
      Rails.cache.clear
    end
    it 'responds successfully with HTTP 200 OK' do
      allow(controller).to receive(:authenticate_request).and_return(true)
      allow(controller).to receive(:guid).and_return('3719A628-9EFC-4D62-B019-0C7B8D066F55')
      allow(controller).to receive(:pgt).and_return('PGT-4321-0123456789abcdef')

      stub_request(:get, 'https://tntdataserver.eu/portalusers/DSPortalUsers.asmx?WSDL')
        .to_return(body: File.read('spec/fixtures/portal_users_service/wsdl.xml'), status: 200)

      savon.expects(:get_portals_for_user)
        .with(message: { username: ENV.fetch('SOAP_USERNAME'),
                         password: ENV.fetch('SOAP_PASSWORD'),
                         sso_code: '3719A628-9EFC-4D62-B019-0C7B8D066F55' })
        .returns(File.read('spec/fixtures/portal_users_service/get_portals_for_user.xml'))

      get :countries
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json.length).to eq(3)
    end
  end
end
