class PullRequestsLinksController < ::ApplicationController
  def create
    pull_requests_link = params[:text]
    match = pull_requests_link.match(/.*(github.com\/youse-seguradora\/.*\/pull\/\d*)/)
    if match
      pull_request = PullRequestsLink.find_or_create_by(link: match[1])
      pull_request.count += 1 if pull_request
      pull_request.save
    end
  end

  def show
    pull_requests_link = params[:text]
    match = pull_requests_link.match(/.*(github.com\/youse-seguradora\/.*\/pull\/\d*)/)
    pull_request = PullRequestsLink.find_by(link: match[1])

    render json: { response_type: 'in_channel', text: "Você já mandou #{pull_request.count}x o link desse PR!"} if pull_request
  end
end
