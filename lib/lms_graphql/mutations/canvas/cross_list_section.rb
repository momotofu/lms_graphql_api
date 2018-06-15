require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/section"
module LMSGraphQL
  module Mutations
    module Canvas
      class CrossListSection < CanvasBaseMutation
        argument :id, ID, required: true
        argument :new_course_id, ID, required: true
        field :section, LMSGraphQL::Types::Canvas::CanvasSection, null: false
        def resolve(id:, new_course_id:)
          ctx[:canvas_api].proxy(
            "CROSS_LIST_SECTION",
            {
              "id": id,
              "new_course_id": new_course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end