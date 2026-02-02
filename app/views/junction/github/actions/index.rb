# frozen_string_literal: true

module Junction
  module Github
    # Displays a list of GitHub Actions workflows for a given entity.
    #
    # @todo Implement search, filtering, refresh, and pagination.
    class Views::Actions::Index < Junction::Components::Base
      def initialize(entity:, workflow_runs:, frame_id:)
        @entity = entity
        @workflow_runs = workflow_runs
        @frame_id = frame_id
      end

      def view_template
        turbo_frame_tag(@frame_id) do
          div(class: "bg-white dark:bg-gray-800 rounded-xl shadow pb-5") do
            Components::Actions::WorkflowRunsTable(entity: @entity, workflow_runs: @workflow_runs)
          end
        end
      end
    end
  end
end
