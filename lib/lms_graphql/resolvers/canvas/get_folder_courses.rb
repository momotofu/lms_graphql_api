require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetFolderCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasFolder, null: false
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, id:)
          context[:canvas_api].proxy(
            "GET_FOLDER_COURSES",
            {
              "course_id": course_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end