include ActionView::Helpers::TagHelper

module ApplicationHelper
  class ActionView::Helpers::FormBuilder
    def error_message method, options={}
      errors = object.errors.full_messages_for method
      if errors.present?
        extra_class = options.fetch(:class, '')
        content_tag :div, errors.to_sentence, class: "error-message #{extra_class}"
      end
    end
  end
end
