# frozen_string_literal: true

module Junction
  module Github
    # Shared controller behavior for GitHub issues.
    module IssuesConcern
      extend ActiveSupport::Concern

      included do
        before_action :set_entity
      end

      def issues
        authorize! @entity, with: IssuePolicy, to: :show?
        render Junction::Github::Views::Issues::Index.new(
          entity: @entity,
          issues: RepositoryService.new(slug:).issues,
          frame_id: frame_id("github-issues")
        )
      end
    end
  end
end
