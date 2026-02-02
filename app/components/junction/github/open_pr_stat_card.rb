# frozen_string_literal: true

module Junction
  module Github
    module Components
      class OpenPrStatCard < Base
        def template
          render StatCard.new(
            title: "Open Pull Requests",
            value:,
            status:,
            icon: "git-pull-request-arrow"
          )
        end

        private

        def value
          @value ||= service.paged { service.pull_requests }.count
        end
      end
    end
  end
end
