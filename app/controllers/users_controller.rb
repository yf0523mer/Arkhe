class UsersController < ApplicationController
	def top

	end


	private
        def user_params
        	params.require(:user).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :nickname, :email)
        end
        def delete_user_params
            params.require(:user).permit(:deleated)
        end
end
