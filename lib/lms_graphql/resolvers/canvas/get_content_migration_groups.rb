require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_migration"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetContentMigrationGroup < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasContentMigration, null: false
        argument :group_id, ID, required: true
        argument :id, ID, required: true
        def resolve(group_id:, id:)
          context[:canvas_api].proxy(
            "GET_CONTENT_MIGRATION_GROUPS",
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