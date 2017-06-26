class PullRequestsLink < ApplicationRecord
  validates :link, uniqueness: true
end
