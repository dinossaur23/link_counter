class PullRequestsLinksController < ::ApplicationController
  def create
    pull_requests_link = params[:text]
    if pull_requests_link.match(/.*github.com\/youse-seguradora\/.*\/pull\/\d*/).present?
      pull_request = PullRequestsLink.find_or_create_by(link: pull_requests_link)
      pull_request.count += 1 if pull_request
      pull_request.save
    end
  end
end
