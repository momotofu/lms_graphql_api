require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group_category"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleGroupCategory < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasGroupCategory, null: false
        argument :group_category_id, ID, required: true
        def resolve(group_category_id:, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_GROUP_CATEGORY").proxy(
            "GET_SINGLE_GROUP_CATEGORY",
            {
              "group_category_id": group_category_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end