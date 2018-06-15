require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleUserLti < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::User, null: false
        argument :id, ID, required: true
        def resolve(id:)
          context[:canvas_api].proxy(
            "GET_SINGLE_USER_LTI",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end