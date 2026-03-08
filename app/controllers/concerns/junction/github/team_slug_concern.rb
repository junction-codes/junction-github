# frozen_string_literal: true

module Junction
  module Github
    # Shared controller behavior for team slug annotations.
    module TeamSlugConcern
      extend ActiveSupport::Concern

      private

      def slug
        @entity.annotations.fetch(Engine::ANNOTATION_TEAM_SLUG, nil)
      end
    end
  end
end
