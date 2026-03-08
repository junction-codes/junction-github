# frozen_string_literal: true

module Junction
  module Github
    class GroupsController < ApplicationController
      include TeamSlugConcern
      include IssuesConcern
      include PullRequestsConcern

      private

      def entity_class
        Junction::Group
      end
    end
  end
end
