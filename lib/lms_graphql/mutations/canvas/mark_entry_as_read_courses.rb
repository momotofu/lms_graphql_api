require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class MarkEntryAsReadCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :topic_id, ID, required: true
        argument :entry_id, ID, required: true
        argument :forced_read_state, Boolean, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, topic_id:, entry_id:, forced_read_state: nil)
          context[:canvas_api].call("MARK_ENTRY_AS_READ_COURSES").proxy(
            "MARK_ENTRY_AS_READ_COURSES",
            {
              "course_id": course_id,
              "topic_id": topic_id,
              "entry_id": entry_id
            },
            {
              "forced_read_state": forced_read_state
            },
          ).parsed_response
        end
      end
    end
  end
end