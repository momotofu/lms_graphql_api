require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ResolvePathUser < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::Folder], null: false
        argument :user_id, ID, required: true
        def resolve(user_id:)
          context[:canvas_api].proxy(
            "RESOLVE_PATH_USERS",
            {
              "user_id": user_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end