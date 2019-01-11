class MonitorsController < ApplicationController
  newrelic_ignore

  def lb
    render body: 'OK'
  end
end
