require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/migration_issue"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListMigrationIssuesCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::MigrationIssue], null: false
        argument :course_id, ID, required: true
        argument :content_migration_id, ID, required: true
        def resolve(course_id:, content_migration_id:)
          context[:canvas_api].proxy(
            "LIST_MIGRATION_ISSUES_COURSES",
            {
              "course_id": course_id,
              "content_migration_id": content_migration_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end