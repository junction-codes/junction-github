# frozen_string_literal: true

module Junction
  module Github
    # Access policy for GitHub actions.
    class ActionPolicy < PluginPolicy
      def context
        "actions"
      end
    end
  end
end
