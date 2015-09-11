require 'savon'

class DataQueryService

  def initialize(service)
    @service = service.sub('dataqueryservice.asmx', 'dataqueryservice2.asmx')
  end

  def client
    @client ||= Savon.client(wsdl: "#{@service}?WSDL",
                 logger: Rails.logger,
                 log_level: Rails.application.config.log_level,
                 log: Rails.env.development?,
                 pretty_print_xml: true) do
      convert_request_keys_to :camelcase
    end
  end

  def login(pgt)
    proxy_ticket = RubyCAS::Filter.client.request_proxy_ticket(pgt, @service)
    res = client.call(
      :auth_login,
      message: {
        service_name: proxy_ticket.service,
        service_ticket: proxy_ticket.ticket,
        auto_register: true
      }
    )

    Rails.logger.debug(res.to_hash)
    res.to_hash
  end

  def profiles(pgt)
    session_id = login(pgt)[:auth_login_response][:auth_login_result][:session_id]
    Rails.logger.debug(session_id)

    res = client.call(
      :my_web_user_get_info,
      message: {
        session_i_d: session_id
      }
    )

    Array.wrap(res.to_hash[:my_web_user_get_info_response][:my_web_user_get_info_result][:staff_profiles][:staff_profile_info])
  end
end