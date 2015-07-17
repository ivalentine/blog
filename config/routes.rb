Rails.application.routes.draw do

  year_month_format = { year: /\d{4}/, month: /(0[1-9]|1[0-2])/ }

  root 'posts#index', as: :posts

  post '/', to: 'posts#create', constraints: year_month_format

  get 'new-post', to: 'posts#new', as: :new_post

  get ':year/:month/:slug/edit', to: 'posts#edit',
    constraints: year_month_format, as: :edit_post

  get '(:year)/(:month)/(:slug)', to: 'posts#show',
    constraints: year_month_format, as: :post

  match ':year/:month/:slug', to: 'posts#update',
    constraints: year_month_format, via: [:patch, :put]

  delete ':year/:month/:slug', to: 'posts#destroy',
    constraints: year_month_format

end
