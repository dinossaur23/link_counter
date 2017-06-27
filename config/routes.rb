Rails.application.routes.draw do
  post :link_counter, to: 'pull_requests_links#create'
  get :link_counter, to: 'pull_requests_links#show'
end
