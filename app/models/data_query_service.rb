require 'savon'

class DataQueryService

  def initialize(service, guid, pgt)
    @service = service.sub('dataqueryservice.asmx', 'dataqueryservice2.asmx')
    @guid = guid
    @pgt = pgt
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

  def session_id
    proxy_ticket = RubyCAS::Filter.client.request_proxy_ticket(@pgt, @service)
    res = client.call(
      :auth_login,
      message: {
        service_name: proxy_ticket.service,
        service_ticket: proxy_ticket.ticket,
        auto_register: true
      }
    )

    Rails.logger.debug(res.to_hash)
    res.to_hash[:auth_login_response][:auth_login_result][:session_id]
  end

  def profiles
    Rails.cache.fetch(['v1', @guid, @service, 'profiles']) do
      res = client.call(
        :my_web_user_get_info,
        message: {
          session_i_d: session_id
        }
      )

      profiles = res.to_hash[:my_web_user_get_info_response][:my_web_user_get_info_result][:staff_profiles]
      Array.wrap(profiles ? profiles[:staff_profile_info] : [])
    end
  end

  def transactions(profile_code, date_from, date_to, account)
    Rails.cache.fetch(['v3', @guid, @service, profile_code, date_from, date_to, account, 'transactions']) do
      res = client.call(
        :staff_portal_get_financial_transactions,
        message: {
          session_i_d: session_id,
          staff_profile_code: profile_code,
          date_from: date_from,
          date_to: date_to,
          financial_account_filter: account,
          mark_as_published: false
        }
      )

      res.to_hash[:staff_portal_get_financial_transactions_response][:staff_portal_get_financial_transactions_result]
    end
  end

  def donations(profile_code, date_from, date_to, account)
    Rails.cache.fetch(['v1', @guid, @service, profile_code, date_from, date_to, account, 'transactions']) do
      res = client.call(
        :staff_portal_get_gifts_received,
        message: {
          session_i_d: session_id,
          staff_profile_code: profile_code,
          date_from: date_from,
          date_to: date_to,
          designation_filter: account
        }
      )
      donations = res.to_hash[:staff_portal_get_gifts_received_response][:staff_portal_get_gifts_received_result] || {gift: []}
      donations[:gift]
    end
  end
end