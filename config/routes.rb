Rails.application.routes.draw do
  get 'monitors/lb'
  get 'ministry_view/:action', controller: 'ministry_view', as: :ministry_view
end
