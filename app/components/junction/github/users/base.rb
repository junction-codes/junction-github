# frozen_string_literal: true

module Junction
  module Github
    module Components
      module Users
        # Base class for user related components.
        #
        # @abstract
        class Base < Junction::Components::Base
          attr_reader :entity

          # Initialize a new component.
          #
          # @param entity [ApplicationRecord] The entity representing the user.
          # @param user [Hash] The GitHub user data, if already loaded.
          # @param user_attrs [Hash] Additional attributes for the component.
          def initialize(entity:, user: nil, **user_attrs)
            @entity = entity

            @user = user
            super(**user_attrs)
          end

          private

          # Service used to fetch user data.
          #
          # @return [UserService]
          def service
            @service ||= UserService.new(username:)
          end

          # User data from GitHub.
          #
          # @return [Hash]
          def user
            @user ||= service.user
          end

          # Username of the user from the entity annotations.
          #
          # @return [String]
          def username
            @username ||= @entity.annotations[Engine::ANNOTATION_USER_LOGIN]
          end
        end
      end
    end
  end
end
