module Presenters
  module Posts
    class Simple
      include ActionView::Helpers::TextHelper

      class << self
        def count_comments_for(post)
          post.comments.count
        end
      end

      def format(text)
        simple_format(text)
      end
    end
  end
end
