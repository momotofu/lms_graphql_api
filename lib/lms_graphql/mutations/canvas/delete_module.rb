require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/module"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteModule < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        field :module, LMSGraphQL::Types::Canvas::CanvasModule, null: false
        def resolve(course_id:, id:)
          context[:canvas_api].call("DELETE_MODULE").proxy(
            "DELETE_MODULE",
            {
              "course_id": course_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end