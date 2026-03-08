# frozen_string_literal: true

module Junction
  module Github
    # Access policy for GitHub issues.
    class IssuePolicy < PluginPolicy
      def context
        "issues"
      end
    end
  end
end
