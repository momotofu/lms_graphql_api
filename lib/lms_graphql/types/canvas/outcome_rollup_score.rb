require_relative "../canvas_base_type"
require_relative "outcome_rollup_score_link"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomeRollupScore < BaseType
        description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
        field :score, Int, "The rollup score for the outcome, based on the student alignment scores related to the outcome. This could be null if the student has no related scores..Example: 3", null: true
        field :count, Int, "The number of alignment scores included in this rollup..Example: 6", null: true
        field :links, LMSGraphQL::Types::Canvas::CanvasOutcomeRollupScoreLink, "Example: 42", null: true

      end
    end
  end
end