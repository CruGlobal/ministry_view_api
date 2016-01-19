class MonitorsController < ApplicationController
  newrelic_ignore

  def lb
    render status: :ok, plain: 'OK'
  end
end
