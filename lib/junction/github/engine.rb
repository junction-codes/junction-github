# frozen_string_literal: true

require "junction-codes"
require "omniauth-github"
require "junction/github/core_plugin"
require "junction/github/actions_plugin"
require "junction/github/issues_plugin"
require "junction/github/pull_requests_plugin"

module Junction
  module Github
    class Engine < ::Rails::Engine
      ANNOTATION_PROJECT_SLUG = "github.com/project-slug"
      ANNOTATION_TEAM_SLUG = "github.com/team-slug"
      ANNOTATION_USER_LOGIN = "github.com/user-login"

      DOMAIN = "github.com"

      HAS_PROJECT_SLUG = ->(context:) { context.annotations[ANNOTATION_PROJECT_SLUG].present? }.freeze
      HAS_TEAM_SLUG = ->(context:) { context.annotations[ANNOTATION_TEAM_SLUG].present? }.freeze
      HAS_USER_LOGIN = ->(context:) { context.annotations[ANNOTATION_USER_LOGIN].present? }.freeze

      isolate_namespace Junction::Github

      ActiveSupport.on_load(:junction_plugins) do
        Junction::Github::CorePlugin.register
        Junction::Github::ActionsPlugin.register
        Junction::Github::IssuesPlugin.register
        Junction::Github::PullRequestsPlugin.register
      end
    end
  end
end
