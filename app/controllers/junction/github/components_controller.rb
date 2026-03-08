# frozen_string_literal: true

module Junction
  module Github
    class ComponentsController < ApplicationController
      include ProjectSlugConcern
      include ActionsConcern
      include IssuesConcern
      include PullRequestsConcern

      private

      def entity_class
        Junction::Component
      end
    end
  end
end
