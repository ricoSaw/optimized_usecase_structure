module Forms
  module Posts
    class UpdateByUser
      include ActiveModel::Model

      attr_accessor(
        :title,
        :body
      )

      validates :title, {:presence => true}
      validates :body, {:presence => true}

      def for_post(post)
         @title = post.title
         @body  = post.body
         self
      end

      def set_id(post_id)
         @id = post_id
         self
      end

      def call
        if valid?
          update_post
        else
          false
        end
      end

      private

      def update_post
        Post.find(@id).update(title: @title, body: @body)
      end
    end
  end
end
