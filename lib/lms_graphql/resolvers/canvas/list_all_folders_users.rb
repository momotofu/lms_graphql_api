require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAllFoldersUser < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasFolder], null: false
        argument :user_id, ID, required: true
        def resolve(user_id:)
          context[:canvas_api].proxy(
            "LIST_ALL_FOLDERS_USERS",
            {
              "user_id": user_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end