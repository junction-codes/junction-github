# frozen_string_literal: true

module Junction
  module Github
    # Base access policy for GitHub integrations.
    #
    # @abstract
    class PluginPolicy < Junction::ApplicationPolicy
      DOMAIN = CorePlugin::DOMAIN
    end
  end
end
