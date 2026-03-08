# frozen_string_literal: true

module Junction
  module Github
    # Shared controller behavior for GitHub actions.
    module ActionsConcern
      extend ActiveSupport::Concern

      included do
        before_action :set_entity
      end

      def actions
        authorize! @entity, with: ActionPolicy, to: :show?
        render Junction::Github::Views::Actions::Index.new(
          entity: @entity,
          workflow_runs: RepositoryService.new(slug:).workflow_runs,
          frame_id: frame_id("github-actions"),
        )
      end
    end
  end
end
