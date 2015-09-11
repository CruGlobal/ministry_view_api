class MinistryViewController < ApplicationController
  before_action :cas_filter

  def index

  end

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

  private

  def cas_filter
    RubyCAS::Filter.filter(self)
  end

  def guid
    session['cas_extra_attributes']['ssoGuid']
  end

  def data_query_service
    DataQueryService.new(params[:portal_uri], guid, session[:cas_pgt])
  end
end
