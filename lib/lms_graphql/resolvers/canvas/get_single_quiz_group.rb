require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/quiz_group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleQuizGroup < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasQuizGroup, null: false
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, quiz_id:, id:)
          context[:canvas_api].proxy(
            "GET_SINGLE_QUIZ_GROUP",
            {
              "course_id": course_id,
              "quiz_id": quiz_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end