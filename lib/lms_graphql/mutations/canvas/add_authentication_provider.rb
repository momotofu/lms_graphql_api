require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/authentication_provider"
module LMSGraphQL
  module Mutations
    module Canvas
      class AddAuthenticationProvider < CanvasBaseMutation
        argument :account_id, ID, required: true
        field :authentication_provider, LMSGraphQL::Types::Canvas::AuthenticationProvider, null: false
        def resolve(account_id:)
          ctx[:canvas_api].proxy(
            "ADD_AUTHENTICATION_PROVIDER",
            {
              "account_id": account_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end