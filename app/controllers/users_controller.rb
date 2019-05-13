class UsersController < ApplicationController


	def top

	end

	def index
		@user = current_user
		@search = Post.ransack(params[:q])
	    @results = @search.result.where(deleted: 'false')
	    @feed_items = current_user.feed.paginate(page: params[:page]).where(deleted: 'false')
	end

	def show
		@user = current_user
		@users = User.find(params[:id])
	    @search = Post.ransack(params[:q])
	    @results = @search.result.where(deleted: 'false')
	    @posts = @users.posts.where(deleted: 'false')
	end

	def edit
		@user = User.find(params[:id])
		if current_user.id == @user.id || current_user.admin == true
		else
	       redirect_to user_path(@user.id)
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end

    def destroy
	    @users = User.find(params[:id])
	    @users.update(delete_user_params)
	    redirect_to root_path
    end

    def following
	    @title = "Following"
	    @user  = User.find(params[:id])
	    @users = @user.following.paginate(page: params[:page])
	    render 'show_follow'
	end

	def followers
	    @title = "Followers"
	    @user  = User.find(params[:id])
	    @users = @user.followers.paginate(page: params[:page])
	    render 'show_follow'
	end

	private
        def user_params
        	params.require(:user).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :nickname, :email, :image, :introduction)
        end
        def delete_user_params
            params.require(:user).permit(:deleted)
        end
end
