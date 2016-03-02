class CommentsController < ApplicationController

  # POST /posts
  # POST /posts.json
  def create
    @comment = Comment.new(post_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.post_id), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to post_path(@comment.post_id), notice: 'Error while creating Comment.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:comment).permit(:post_id, :body)
    end
end
