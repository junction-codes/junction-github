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
    end
  end
end
