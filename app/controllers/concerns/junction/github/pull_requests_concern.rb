# frozen_string_literal: true

module Junction
  module Github
    # Shared controller behavior for GitHub pull requests.
    module PullRequestsConcern
      extend ActiveSupport::Concern

      included do
        before_action :set_entity
      end

      def pull_requests
        authorize! @entity, to: :show?
        render Junction::Github::Views::PullRequests::Index.new(
          entity: @entity,
          pull_requests: service.pull_requests,
          frame_id: frame_id("github-pull-requests")
        )
      end

      private

      def service
        (entity_class == Group ? TeamService : RepositoryService).new(slug:)
      end
    end
  end
end
