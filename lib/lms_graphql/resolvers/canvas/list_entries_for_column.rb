require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/column_datum"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListEntriesForColumn < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasColumnDatum], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :include_hidden, Boolean, required: false
        def resolve(course_id:, id:, include_hidden: nil, get_all: false)
          result = context[:canvas_api].call("LIST_ENTRIES_FOR_COLUMN").proxy(
            "LIST_ENTRIES_FOR_COLUMN",
            {
              "course_id": course_id,
              "id": id,
              "include_hidden": include_hidden            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end