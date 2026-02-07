# frozen_string_literal: true

module Junction
  module Github
    # Base controller for the GitHub plugin.
    #
    # @abstract
    class ApplicationController < Junction::PluginController
      private

      # Build a Turbo frame ID based on the entity type.
      #
      # @param suffix [String] The suffix to append to the entity type.
      # @return [String] The Turbo frame ID.
      def frame_id(suffix)
        "#{entity_key.to_s.sub(/_id\z/, '')}-#{suffix}"
      end

      # Retrieve the appropriate slug annotation based on the entity type.
      #
      # @return [String] The slug annotation value, if present.
      def slug
        @entity.annotations.fetch(
          context == Group ? Engine::ANNOTATION_TEAM_SLUG : Engine::ANNOTATION_PROJECT_SLUG,
          nil
        )
      end
    end
  end
end
