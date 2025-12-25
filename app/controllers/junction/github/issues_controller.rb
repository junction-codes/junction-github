# frozen_string_literal: true

module Junction
  module Github
    class IssuesController < ApplicationController
      before_action :set_entity

      def index
        render Junction::Github::Views::Issues::Index.new(
          entity: @entity,
          issues: RepositoryService.new(slug:).issues,
          frame_id: frame_id("github-issues")
        )
      end
    end
  end
end
