# frozen_string_literal: true

module Junction
  module Github
    # Junction GitHub Issues plugin.
    class IssuesPlugin < ApplicationPlugin
      domain CorePlugin::DOMAIN
      description "GitHub Issues integration for Junction"
      icon "github"
      plugin_name "github-issues"
      title "GitHub Issues"

      permission context: "issues", ownership: :all, access: :read,
                 description: "Read access to all GitHub Issues."
      permission context: "issues", ownership: :owned, access: :read,
                 description: "Read access to GitHub Issues on owned entites."

      %w[api component].each do |context|
        for_entity "Junction::#{context.classify}", CorePlugin::HAS_PROJECT_SLUG do |scope|
          scope.action method: :"#{context}_github_issues_path",
                       controller: "junction/github/#{context.pluralize}",
                       action: "issues"
          scope.tab title: "Issues", icon: "bug",
                    action: :"#{context}_github_issues_path",
                    access: { action: :show?, with: "IssuePolicy" }

          scope.component slot: :overview_cards, component: "Components::OpenIssuesStatCard"
        end
      end
    end
  end
end
