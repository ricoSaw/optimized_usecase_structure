module Services
  module Posts
    class DoCrazyStuff

      def initialize(post)
        @post = Decorators::Posts::CrazyStuff.new(post)
        @post = Decorators::Posts::AdditionalStuff.new(@post)
      end

      def call
        do_crazy_stuff
      end

      private

      def do_crazy_stuff
        "#{@post.add_crazy_stuff} #{@post.foo}"
      end
    end
  end
end
