module Decorators
  module Posts
    class AdditionalStuff < ::Decorators::DecoratorBase

      def foo
        "Foo #{@decorated.body}"
      end
    end
  end
end
