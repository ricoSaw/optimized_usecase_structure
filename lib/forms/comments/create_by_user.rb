module Forms
  module Comments
    class CreateByUser
      include ActiveModel::Model

      attr_accessor(
        :body,
        :post_id
      )

      validates :body, {:presence => true}
      validates :post_id, {:presence => true}

      def call
        create_comment if valid?
      end

      private

      def create_comment
        Comment.create(body: @body, post_id: @post_id)
      end
    end
  end
end
