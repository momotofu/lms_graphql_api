require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ResolvePathGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::Folder], null: false
        argument :group_id, ID, required: true
        def resolve(group_id:)
          context[:canvas_api].proxy(
            "RESOLVE_PATH_GROUPS",
            {
              "group_id": group_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end