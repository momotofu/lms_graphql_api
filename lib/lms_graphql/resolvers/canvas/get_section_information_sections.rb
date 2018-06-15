require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/section"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSectionInformationSection < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasSection, null: false
        argument :id, ID, required: true
        argument :include, String, required: false
        def resolve(id:, include: nil)
          context[:canvas_api].proxy(
            "GET_SECTION_INFORMATION_SECTIONS",
            {
              "id": id,
              "include": include            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end