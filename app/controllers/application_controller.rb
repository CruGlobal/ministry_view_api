class ApplicationController < ActionController::API
  force_ssl(if: :ssl_configured?, except: :lb)

  protected

  def render_error(message, options = {})
    render(
      json: CruAuthLib::ApiError.new(message: message),
      status: options[:status] || :bad_request # 400
    )
  end

  def ssl_configured?
    request.get? && !Rails.env.development? && !Rails.env.test?
  end
end
