require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/feature_flag"
module LMSGraphQL
  module Mutations
    module Canvas
      class RemoveFeatureFlagAccount < CanvasBaseMutation
        argument :account_id, ID, required: true
        argument :feature, String, required: true
        field :feature_flag, LMSGraphQL::Types::Canvas::CanvasFeatureFlag, null: false
        def resolve(account_id:, feature:)
          ctx[:canvas_api].proxy(
            "REMOVE_FEATURE_FLAG_ACCOUNTS",
            {
              "account_id": account_id,
              "feature": feature            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end