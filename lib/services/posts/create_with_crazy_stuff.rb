module Services
  module Posts
    class CreateWithCrazyStuff

      def initialize(post)
        @post = Decorators::Posts::CrazyStuff.new(post)
      end

      def call
        add_crazy_stuff
      end

      private

      def add_crazy_stuff
        @post.add_crazy_stuff_to_body
      end
    end
  end
end
