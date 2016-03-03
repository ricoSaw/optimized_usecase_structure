class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment_form         = Forms::Comments::CreateByUser.new
    @comment_form.post_id = @post.id

    @presenter = Presenters::Posts::Simple.new
  end

  # GET /posts/new
  def new
    @post_form = Forms::Posts::CreateByUser.new
  end

  # GET /posts/1/edit
  def edit
    @post_form = Forms::Posts::UpdateByUser.new.for_post(@post)
  end

  # POST /posts
  # POST /posts.json
  def create
    @post_form = Forms::Posts::CreateByUser.new(post_params)

    respond_to do |format|
      if post = @post_form.call
        format.html { redirect_to post_path(post.id), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post_form = Forms::Posts::UpdateByUser.new(post_params).set_id(@post.id)

    respond_to do |format|
      if @post_form.call
        format.html { redirect_to post_path(@post.id), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
