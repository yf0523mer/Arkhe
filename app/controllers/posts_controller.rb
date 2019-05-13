class PostsController < ApplicationController
	def index
    #(params[:q])に検索パラメーターが入り、Productテーブルを検索する@searchオブジェクトを生成
    @search = Post.ransack(params[:q])
    #検索結果を表示する@resultsオブジェクトを生成
    @results = @search.result
  end

  def new

		@post = Post.new
		@post.images.build
    @post.places.build
	end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @search = Post.ransack(params[:q])
    @results = @search.result
  end

	def create
    	@post = Post.new(post_params)
    	@post.user_id = current_user.id
    if @post.save
        redirect_to post_path(@post.id)
    else
        @post = Post.new
        @image = Image.new
        render :new
    end
  end

	def update
  		@post = Post.find(params[:id])
  		@post.update(post_params)
  		redirect_to post_path(@post.id)
	end

	def destroy
  		@post = Post.find(params[:id])
  		@post.update(delete_post_params)
  		redirect_to user_path(current_user.id) #今はとりあえず
	end

  def map
    results = Geocoder.search(params[:address])
    @latlng = results.first.coordinates
    # これでmap.js.erbで、経度緯度情報が入った@latlngを使える。
    respond_to do |format|
      format.js
    end
  end

	private
    def post_params
        params.require(:post).permit(:title, :user_id, :text, :distance, :deleated,
          images_images: [], places_attributes: [:address,:order])
    end
    def delete_post_params
        params.require(:post).permit(:deleated)
    end
end