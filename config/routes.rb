Rails.application.routes.draw do

  root "bills#index"
  get 'bill', to: 'bills#index'
end
