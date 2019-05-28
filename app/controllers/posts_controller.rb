class PostsController < ApplicationController
  before_action :authenticate_user!
	def index
      #論理削除済みのユーザを取ってくる
      @delete_user = User.where(deleted: 'true')
      #(params[:q])に検索パラメーターが入り、Productテーブルを検索する@searchオブジェクトを生成
      @search = Post.ransack(params[:q])
      #検索結果を表示する@resultsオブジェクトを生成
      @results = @search.result.where(deleted: 'false')
  end

  def new
  		@post = Post.new
      p  = ENV["GMAP"]
      #@postに関連づけたimages,placesをbuild
  		@post.images.build
      @post.places.build
	end

    def show
      @post = Post.find(params[:id])
      @user = User.find(@post.user_id)
      if @user.deleted == true || @post.deleted == true
        redirect_to users_path
      else
        @comment = Comment.new
        @search = Post.ransack(params[:q])
        @results = @search.result
        @places = @post.places
        #root()のメソッド呼び出し
        root()
      end
  end

	def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      if @post.save
          redirect_to post_path(@post.id)
      else
          @post = Post.new
          @image = Image.new
          flash.now[:error] = "Any error has occurred. Please check your post."
          render :new
      end
  end

  def edit
      @user = current_user
      @post = Post.find(params[:id])
      #root()のメソッド呼び出し
      root()
      if current_user.id == @post.user_id || current_user.admin == true
      else
        redirect_to post_path(@post.id)
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
      #今はとりあえずユーザのパスへ遷移
  		redirect_to user_path(current_user.id)
	end

  def map
      results = Geocoder.search(params[:address])
      @latlng = results.first.coordinates
      # これでmap.js.erbで、経度緯度情報が入った@latlngを使える。
      respond_to do |format|
        format.js
      end
  end

  def root()
      @post = Post.find(params[:id])
      @user = User.find(@post.user_id)
      #
      @data = []
      @post.places.order(order:"ASC").each do |place|
        @address = place.address
        @data << Geocoder.coordinates(@address)
      end
      gon.locations = @data
      gon.location = @data.first
  end

	private
    def post_params
        params.require(:post).permit(:title, :user_id, :text, :deleated,
          images_images: [], places_attributes: [:address, :order, :_destroy])
    end
    def delete_post_params
        params.require(:post).permit(:deleted)
    end
end