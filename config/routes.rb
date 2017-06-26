Rails.application.routes.draw do
  match 'link_counter', to: 'pull_requests_links#create', via: [:get, :post]
end
