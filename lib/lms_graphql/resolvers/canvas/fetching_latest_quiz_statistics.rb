require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class FetchingLatestQuizStatistic < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :all_versions, Boolean, required: false
        def resolve(course_id:, quiz_id:, all_versions: nil, get_all: false)
          result = context[:canvas_api].call("FETCHING_LATEST_QUIZ_STATISTICS").proxy(
            "FETCHING_LATEST_QUIZ_STATISTICS",
            {
              "course_id": course_id,
              "quiz_id": quiz_id,
              "all_versions": all_versions            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end