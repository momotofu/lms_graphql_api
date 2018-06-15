require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleAccount < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::Account, null: false
        argument :id, ID, required: true
        def resolve(id:)
          context[:canvas_api].proxy(
            "GET_SINGLE_ACCOUNT",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end