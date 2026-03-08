# frozen_string_literal: true

module Junction
  module Github
    # Shared controller behavior for project slug annotations.
    module ProjectSlugConcern
      extend ActiveSupport::Concern

      private

      def slug
        @entity.annotations.fetch(Engine::ANNOTATION_PROJECT_SLUG, nil)
      end
    end
  end
end
