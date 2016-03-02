module Decorators
  module Posts
    class CrazyStuff < ::Decorators::DecoratorBase

      def add_crazy_stuff_to_body
        "This is crazy stuff! #{@decorated.body}"
      end
    end
  end
end
