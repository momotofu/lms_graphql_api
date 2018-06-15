require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grading_standard"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGradingStandardsAvailableInContextCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGradingStandard], null: false
        argument :course_id, ID, required: true
        def resolve(course_id:)
          context[:canvas_api].proxy(
            "LIST_GRADING_STANDARDS_AVAILABLE_IN_CONTEXT_COURSES",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end