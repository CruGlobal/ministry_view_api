class MinistryViewController < ApplicationController
  before_action :cas_filter

  def index

  end

  def countries
    guid = session['cas_extra_attributes']['ssoGuid']
    render json: PortalUsersService.new.countries(guid).to_json
  end

  private

  def cas_filter
    RubyCAS::Filter.filter(self)
  end
end
