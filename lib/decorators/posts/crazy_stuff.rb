module Decorators
  module Posts
    class CrazyStuff < ::Decorators::DecoratorBase

      def add_crazy_stuff
        "This is crazy stuff! #{@decorated.body}"
      end
    end
  end
end
