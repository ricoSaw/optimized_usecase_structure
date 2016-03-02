module Forms
  module Posts
    class CreateByUser
      include ActiveModel::Model

      attr_accessor(
        :title,
        :body
      )

      validates :title, {:presence => true}
      validates :body, {:presence => true}

      def call
        create_post if valid?
      end

      private

      def create_post
        Post.create(title: @title, body: @body)
      end
    end
  end
end
