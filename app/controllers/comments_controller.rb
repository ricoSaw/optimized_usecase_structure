class CommentsController < ApplicationController

  # POST /posts
  # POST /posts.json
  def create
    @comment_form = Forms::Comments::CreateByUser.new(comment_params)

    respond_to do |format|
      if comment = @comment_form.call
        format.html { redirect_to post_path(@comment_form.post_id), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: comment }
      else
        format.html { redirect_to post_path(@comment_form.post_id), notice: 'Error while creating Comment.' }
        format.json { render json: @comment_form.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post_id, :body)
    end
end
