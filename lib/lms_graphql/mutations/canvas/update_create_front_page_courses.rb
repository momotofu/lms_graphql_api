require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/page"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateCreateFrontPageCourse < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :wiki_page_title, String, required: false
        argument :wiki_page_body, String, required: false
        argument :wiki_page_editing_roles, String, required: false
        argument :wiki_page_notify_of_update, Boolean, required: false
        argument :wiki_page_published, Boolean, required: false
        field :page, LMSGraphQL::Types::Canvas::CanvasPage, null: false
        def resolve(course_id:, wiki_page_title: nil, wiki_page_body: nil, wiki_page_editing_roles: nil, wiki_page_notify_of_update: nil, wiki_page_published: nil)
          ctx[:canvas_api].proxy(
            "UPDATE_CREATE_FRONT_PAGE_COURSES",
            {
              "course_id": course_id,
              "wiki_page[title]": wiki_page_title,
              "wiki_page[body]": wiki_page_body,
              "wiki_page[editing_roles]": wiki_page_editing_roles,
              "wiki_page[notify_of_update]": wiki_page_notify_of_update,
              "wiki_page[published]": wiki_page_published            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end