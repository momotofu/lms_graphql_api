require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetFolderGroup < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasFolder, null: false
        argument :group_id, ID, required: true
        argument :id, ID, required: true
        def resolve(group_id:, id:)
          context[:canvas_api].proxy(
            "GET_FOLDER_GROUPS",
            {
              "group_id": group_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end