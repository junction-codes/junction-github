# frozen_string_literal: true

module Junction
  module Github
    module Components
      extend Phlex::Kit
    end

    module Views
    end
  end
end

Rails.autoloaders.main.push_dir(
  Junction::Github::Engine.root.join("app/views/junction/github"),
  namespace: Junction::Github::Views
)

Rails.autoloaders.main.push_dir(
  Junction::Github::Engine.root.join("app/components/junction/github"),
  namespace: Junction::Github::Components
)
