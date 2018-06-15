require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/assignment_override"
module LMSGraphQL
  module Mutations
    module Canvas
      class BatchUpdateOverridesInCourse < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :assignment_overrides, [LMSGraphQL::Types::Canvas::AssignmentOverride], required: true
        field :assignment_override, [LMSGraphQL::Types::Canvas::AssignmentOverride], null: false
        def resolve(course_id:, assignment_overrides:)
          ctx[:canvas_api].proxy(
            "BATCH_UPDATE_OVERRIDES_IN_COURSE",
            {
              "course_id": course_id,
              "assignment_overrides": assignment_overrides            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end