Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'monitors/lb' => 'monitors#lb'

  root 'ministry_view#index'

  get 'cas_proxy_callback/:action', controller: 'cas_proxy_callback', as: :cas_proxy_callback
  # get 'cas_proxy_callback/:action', controller: 'cas_proxy_callback'
  get 'ministry_view/:action', controller: 'ministry_view', as: :ministry_view
end
