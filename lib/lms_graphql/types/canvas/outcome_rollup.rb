require_relative "../canvas_base_type"
require_relative "outcome_rollup_score"
require_relative "outcome_rollup_link"

module LMSGraphQL
  module Types
    module Canvas
      class OutcomeRollup < BaseType
        description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
        field :scores, LMSGraphQL::Types::Canvas::OutcomeRollupScore, "an array of OutcomeRollupScore objects.", null: true
        field :name, String, "The name of the resource for this rollup. For example, the user name..Example: John Doe", null: true
        field :links, LMSGraphQL::Types::Canvas::OutcomeRollupLink, "Example: 42, 42, 57", null: true

      end
    end
  end
end