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
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

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

  def send_notification
    fcm = FCM.new('AAAAnca5VAE:APA91bGx7YGV-Vh6-iuGjz72uYs-tlfI5FxvSjJHJT4MIq9ye5T23rhw36kMB45eZLSiIapINNN0zLetCKqNCloaV0dNFu3OUSDcrS6TJGPvnQYmwfkQyvvFwU08kmFquYKT3rNHBKEp')

    fcm_options = {
        notification: {
          body: "This is a Firebase Cloud Messaging Topic Message!",
          title: "FCM Message",
          click_action: "https://google.com"
        },
        data: {
          test1: 1,
          test2: 2
        }
       }

    tokens = ['eJ2Kemz8yEk:APA91bEljZJyHBzVIyi5x1n6Sc75YV-K2kK8v0O0Dqiz_XVdBUJdr8y3pQglKH2GzLfYefwIMgHvCoCd1fK9ooVsQH8PweiVsHZes8dvAlNNxT_ckaUjBlOygoqyVUQ45QrQ8ZDo882U']

    response = fcm.send(tokens, fcm_options)

    puts '---------------------------------------------------------------------'
    puts response
    puts '---------------------------------------------------------------------'

    render text: 'hello'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:creator, :title, :content)
    end
end
