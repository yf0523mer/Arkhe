class UsersController < ApplicationController
	def active_for_authentication?
    	super && current_user.deleted == false
    end

	def top

	end

	def index
		@user = current_user
		@search = Post.ransack(params[:q])
	    @results = @search.result
	end

	def show
		@user = current_user
		@users = User.find(params[:id])
	    @search = Post.ransack(params[:q])
	    @results = @search.result
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

	private
        def user_params
        	params.require(:user).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :nickname, :email, :image, :introduction)
        end
        def delete_user_params
            params.require(:user).permit(:deleted)
        end
end
