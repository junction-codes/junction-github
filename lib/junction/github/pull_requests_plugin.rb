# frozen_string_literal: true

module Junction
  module Github
    # Junction GitHub Pull Requests plugin.
    class PullRequestsPlugin < ApplicationPlugin
      domain CorePlugin::DOMAIN
      description "GitHub Pull Requests integration for Junction"
      icon "boxicons:logo-github:logos"
      plugin_name "github-pull-requests"
      title "GitHub Pull Requests"

      permission context: "pull-requests", ownership: :all, access: :read,
                 description: "Read access to all GitHub Pull Requests."
      permission context: "pull-requests", ownership: :owned, access: :read,
                 description: "Read access to GitHub Pull Requests on owned entites."

      %w[api component].each do |context|
        for_entity "Junction::#{context.classify}", CorePlugin::HAS_PROJECT_SLUG do |scope|
          scope.action method: :"#{context}_github_pull_requests_path",
                       controller: "junction/github/#{context.pluralize}",
                       action: "pull_requests"
          scope.tab title: "Merge Requests", icon: "git-pull-request-arrow",
                    action: :"#{context}_github_pull_requests_path",
                    access: { action: :show?, with: "PullRequestPolicy" }

          scope.component slot: :overview_cards, component: "Components::OpenPrStatCard"
        end
      end

      for_entity "Junction::Group", CorePlugin::HAS_TEAM_SLUG do |scope|
        scope.action method: :group_github_pull_requests_path,
                     controller: "junction/github/groups",
                     action: "pull_requests"
        scope.tab title: "Merge Requests", icon: "git-pull-request-arrow",
                  action: :group_github_pull_requests_path,
                  access: { action: :show?, with: "PullRequestPolicy" }

        scope.component slot: :group_profile_cards, component: "Components::Teams::ProfileCard"
      end
    end
  end
end
