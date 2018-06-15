require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/sis_import_error"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSisImportErrorListSisImport < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasSisImportError], null: false
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        def resolve(account_id:, id:)
          context[:canvas_api].proxy(
            "GET_SIS_IMPORT_ERROR_LIST_SIS_IMPORTS",
            {
              "account_id": account_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end