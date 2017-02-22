class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def all

    @posts = Post.all.order("created_at ASC").sort_by(&:score).reverse

    # if params[:search]
    #   @posts = Post.search(params[:search]).order("created_at ASC")
    # else
    #   @posts = Post.all.order("created_at ASC").sort_by(&:score).reverse
    # end
  end
  # GET /users/:user_id/posts
  # GET /users/:user_id/posts.json
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.all

    if @posts.count == 0
      redirect_to user_path(@user)
      flash[:danger] = "No posts available to see."
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = @post.comments.order("comments.created_at DESC")
  end

  # GET /posts/new
  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new()
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @user = current_user
    @post = @user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
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
      params.require(:post).permit(:title, :body, :user_id, :link, :img_url, category_ids: [])
    end
end
