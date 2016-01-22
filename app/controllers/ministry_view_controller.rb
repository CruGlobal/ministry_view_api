class MinistryViewController < ApplicationController
  include CruLib::AccessTokenProtectedConcern

  before_action :authenticate_request

  def countries
    render json: PortalUsersService.new.countries(guid).to_json
  end

  def profiles
    res = data_query_service.profiles
    render json: res.to_json
  end

  def transactions
    res = data_query_service.transactions(
      params[:profile_code],
      params[:date_from],
      params[:date_to],
      params[:account]
    )

    render json: res.to_json
  end

  def donations
    res = data_query_service.donations(
      params[:profile_code],
      params[:date_from],
      params[:date_to],
      params[:account]
    )

    render json: res.to_json
  end

  private

  def guid
    @access_token.guid
  end

  def pgt
    @access_token.pgt
  end

  def data_query_service
    DataQueryService.new(params[:portal_uri], guid, CASClient::ProxyGrantingTicket.new(pgt, nil))
  end
end
