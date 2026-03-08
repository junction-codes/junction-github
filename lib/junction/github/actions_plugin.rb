# frozen_string_literal: true

module Junction
  module Github
    # Junction GitHub Actions plugin.
    class ActionsPlugin < ApplicationPlugin
      domain CorePlugin::DOMAIN
      description "GitHub Actions integration for Junction"
      icon "github"
      plugin_name "github-actions"
      title "GitHub Actions"

      permission context: "actions", ownership: :all, access: :read,
                 description: "Read access to all GitHub Actions."
      permission context: "actions", ownership: :owned, access: :read,
                 description: "Read access to GitHub Actions on owned entites."
      permission context: "actions", ownership: :all, access: :write,
                 description: "Execute access to all GitHub Actions."
      permission context: "actions", ownership: :owned, access: :write,
                 description: "Execute access to GitHub Actions on owned entites."

      %w[api component].each do |context|
        for_entity "Junction::#{context.classify}", CorePlugin::HAS_PROJECT_SLUG do |scope|
          scope.action method: :"#{context}_github_actions_path",
                       controller: "junction/github/#{context.pluralize}",
                       action: "actions"
          scope.tab title: "CI/CD", icon: "workflow",
                    action: :"#{context}_github_actions_path"
        end
      end
    end
  end
end
