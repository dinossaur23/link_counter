class PullRequestsLinksController < ::ApplicationController
  def create
    pull_requests_link = params[:text]

    match = pull_requests_link.match(/.*(github.com\/youse-seguradora\/.*\/pull\/\d*)/)
    if match
      pull_request = PullRequestsLink.find_or_create_by(link: match[1])
      pull_request.count += 1 if pull_request
      pull_request.save

      render status: 201
    end
  end

  def show
    pull_requests_link = params[:text]
    match = pull_requests_link.match(/.*(github.com\/youse-seguradora\/.*\/pull\/\d*)/)
    pull_request = PullRequestsLink.find_by(link: match[1])
    response = {
      response_type: 'in_channel',
      text: "Você já mandou #{pull_request.count}x o link desse PR nesse canal!"
      attachments: [
        {
        text: "E foi criado em: #{pull_request.created_at}"
        }
      ]
    }

    if pull_request
      render status: 200, json: response
    else
      render status: 204
    end
  end
end
