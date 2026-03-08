# frozen_string_literal: true

module Junction
  module Github
    # Junction GitHub plugin.
    #
    # @todo Should we break these apart into separate plugins for each context?
    class CorePlugin < ApplicationPlugin
      ANNOTATION_PROJECT_SLUG = "github.com/project-slug"
      ANNOTATION_TEAM_SLUG = "github.com/team-slug"
      ANNOTATION_USER_LOGIN = "github.com/user-login"

      DOMAIN = "github.com"

      HAS_PROJECT_SLUG = ->(context:) { context.annotations[ANNOTATION_PROJECT_SLUG].present? }.freeze
      HAS_TEAM_SLUG = ->(context:) { context.annotations[ANNOTATION_TEAM_SLUG].present? }.freeze
      HAS_USER_LOGIN = ->(context:) { context.annotations[ANNOTATION_USER_LOGIN].present? }.freeze

      domain DOMAIN
      description "GitHub integration for Junction"
      icon "github"
      plugin_name "github"
      title "GitHub"

      # TODO: Verify these environment variables are correct.
      if ENV["GITHUB_KEY"].present? && ENV["GITHUB_SECRET"].present?
        auth_provider ENV["GITHUB_KEY"], ENV["GITHUB_SECRET"], callback: ->(auth) {
          Junction::User.find_by(annotations: { ANNOTATION_USER_LOGIN => auth.info.nickname })
        }
      else
        Rails.logger.warn "GitHub authentication is not configured. Please set the GITHUB_KEY and GITHUB_SECRET environment variables."
      end

      %w[api component].each do |context|
        for_entity "Junction::#{context.classify}", HAS_PROJECT_SLUG do |scope|
          scope.annotation key: ANNOTATION_PROJECT_SLUG,
                            title: "GitHub Repository Slug",
                            placeholder: "my-org/my-repo"
        end
      end

      for_entity "Junction::Group", HAS_TEAM_SLUG do |scope|
        scope.annotation key: ANNOTATION_TEAM_SLUG,
                          title: "GitHub Team Slug",
                          placeholder: "my-org/my-team"
      end

      for_entity "Junction::User", HAS_USER_LOGIN do |scope|
        scope.annotation key: ANNOTATION_USER_LOGIN,
                          title: "GitHub Username",
                          placeholder: "benderbendingrodriguez"

        scope.component slot: :user_profile_cards, component: "Components::Users::ProfileCard"
      end
    end
  end
end
