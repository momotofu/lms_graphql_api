require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/migration_issue"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetMigrationIssueUser < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasMigrationIssue, null: false
        argument :user_id, ID, required: true
        argument :content_migration_id, ID, required: true
        argument :id, ID, required: true
        def resolve(user_id:, content_migration_id:, id:)
          context[:canvas_api].proxy(
            "GET_MIGRATION_ISSUE_USERS",
            {
              "user_id": user_id,
              "content_migration_id": content_migration_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end