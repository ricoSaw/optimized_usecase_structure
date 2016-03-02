module Services
  module Posts
    class DuplicateBody
      def initialize(post)
        @post = post
      end

      def call
        duplicate_body
      end

      private

      def duplicate_body
        "#{@post.body} #{@post.body}"
      end
    end
  end
end
