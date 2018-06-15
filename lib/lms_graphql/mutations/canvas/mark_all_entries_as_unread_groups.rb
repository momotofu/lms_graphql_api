require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class MarkAllEntriesAsUnreadGroup < CanvasBaseMutation
        argument :group_id, ID, required: true
        argument :topic_id, ID, required: true
        argument :forced_read_state, Boolean, required: false
        field :return_value, Boolean, null: false
        def resolve(group_id:, topic_id:, forced_read_state: nil)
          ctx[:canvas_api].proxy(
            "MARK_ALL_ENTRIES_AS_UNREAD_GROUPS",
            {
              "group_id": group_id,
              "topic_id": topic_id,
              "forced_read_state": forced_read_state            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end