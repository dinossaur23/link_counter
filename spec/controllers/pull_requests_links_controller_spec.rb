# frozen_string_literal: true
require 'rails_helper'

RSpec.describe PullRequestsLinksController do
  describe 'POST #create' do
    let(:params) do
      { text: 'http://github.com/youse-seguradora/documents/pull/111/files' }
    end

    it 'create a new pull request link' do
      expect { post :create, { params: params } }.to change(PullRequestsLink, :count).by(1)

      # expect(response.code).to eq 201
    end
  end

  describe 'GET #show' do
    let(:params) do
      { text: 'http://github.com/youse-seguradora/documents/pull/111/files' }
    end

    it 'todo' do
      expect { get :show, { params: params } }.to change(PullRequestsLink, :count).by(0)
    end
  end
end
