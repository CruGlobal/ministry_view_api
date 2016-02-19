require 'savon'
class PortalUsersService
  def client
    @client ||= Savon.client(wsdl: 'https://tntdataserver.eu/portalusers/DSPortalUsers.asmx?WSDL',
                             logger: Rails.logger,
                             log_level: Rails.application.config.log_level,
                             log: Rails.env.development?,
                             pretty_print_xml: true) do
      convert_request_keys_to :camelcase
    end
  end

  def countries(guid)
    Rails.cache.fetch(['v2', guid, 'countries']) do
      res = client.call(:get_portals_for_user, message:
                                               { username: ENV.fetch('SOAP_USERNAME'),
                                                 password: ENV.fetch('SOAP_PASSWORD'),
                                                 sso_code: guid })
      if res.to_hash[:get_portals_for_user_response][:get_portals_for_user_result]
        res.to_hash[:get_portals_for_user_response][:get_portals_for_user_result][:dataserver_portal_user]
      else
        []
      end
    end
  end
end
