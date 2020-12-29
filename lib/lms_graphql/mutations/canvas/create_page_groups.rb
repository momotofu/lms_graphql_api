require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/page"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreatePageGroup < BaseMutation
        argument :group_id, ID, required: true
        argument :wiki_page_title, String, required: true
        argument :wiki_page_body, String, required: false
        argument :wiki_page_editing_roles, String, required: false
        argument :wiki_page_notify_of_update, Boolean, required: false
        argument :wiki_page_published, Boolean, required: false
        argument :wiki_page_front_page, Boolean, required: false
        
        
        field :page, LMSGraphQL::Types::Canvas::CanvasPage, null: false
        
        def resolve(group_id:, wiki_page_title:, wiki_page_body: nil, wiki_page_editing_roles: nil, wiki_page_notify_of_update: nil, wiki_page_published: nil, wiki_page_front_page: nil)
          context[:canvas_api].call("CREATE_PAGE_GROUPS").proxy(
            "CREATE_PAGE_GROUPS",
            {
              "group_id": group_id
            },
            {
              "wiki_page[title]": wiki_page_title,
              "wiki_page[body]": wiki_page_body,
              "wiki_page[editing_roles]": wiki_page_editing_roles,
              "wiki_page[notify_of_update]": wiki_page_notify_of_update,
              "wiki_page[published]": wiki_page_published,
              "wiki_page[front_page]": wiki_page_front_page
            },
          ).parsed_response
        end
      end
    end
  end
end