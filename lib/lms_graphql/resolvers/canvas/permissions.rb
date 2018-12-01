require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class Permission < CanvasBaseResolver
        type Boolean, null: false
        argument :account_id, ID, required: true
        argument :permissions, String, required: false
        def resolve(account_id:, permissions: nil)
          context[:canvas_api].call("PERMISSIONS").proxy(
            "PERMISSIONS",
            {
              "account_id": account_id,
              "permissions": permissions            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end