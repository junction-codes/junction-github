# frozen_string_literal: true

module Junction
  module Github
    # Access policy for GitHub pull requests.
    class PullRequestPolicy < PluginPolicy
      def context
        "pull-requests"
      end
    end
  end
end
