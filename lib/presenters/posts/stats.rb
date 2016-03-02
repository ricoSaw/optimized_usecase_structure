module Presenters
  module Posts
    class Stats
      class << self
        def count_comments_for(post)
          post.comments.count
        end

        def count_comments_for(post)
          # some other stas here
        end
      end
    end
  end
end
