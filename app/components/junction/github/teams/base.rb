# frozen_string_literal: true

module Junction
  module Github
    module Components
      module Teams
        # Base class for team related components.
        #
        # @abstract
        class Base < Junction::Components::Base
          attr_reader :entity

          # Initialize a new component.
          #
          # @param entity [ApplicationRecord] The entity representing the group.
          # @param team [Hash] The GitHub team data, if already loaded.
          # @param user_attrs [Hash] Additional attributes for the component.
          def initialize(entity:, team: nil, **user_attrs)
            @entity = entity

            @team = team
            super(**user_attrs)
          end

          private

          # Service used to fetch team data.
          #
          # @return [TeamService]
          def service
            @service ||= TeamService.new(slug:)
          end

          # Team data from GitHub.
          #
          # @return [Hash]
          def team
            @team ||= service.team
          end

          # Team slug from the group's annotations.
          #
          # @return [String]
          def slug
            @slug ||= @entity.annotations[Engine::ANNOTATION_TEAM_SLUG]
          end
        end
      end
    end
  end
end
