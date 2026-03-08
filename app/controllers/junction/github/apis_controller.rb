# frozen_string_literal: true

module Junction
  module Github
    class ApisController < ApplicationController
      include ProjectSlugConcern
      include ActionsConcern
      include IssuesConcern
      include PullRequestsConcern

      private

      def entity_class
        Junction::Api
      end

      # def entity_key
      #   "api_id"
      # end
    end
  end
end
