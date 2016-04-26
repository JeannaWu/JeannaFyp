class FormUsersController < ApplicationController
	before_action :authenticate_user! , except: [:index, :show]
	# Start
   def show
		@user = FormUser.where(:name => params[:name]).first
    	@user = FormUser.find(params[:id])
    	@posts = @user.posts.paginate(:page => 1, :per_page => 36)
       
	end
	#End (http://willschenk.com/setting-up-devise-with-twitter-and-facebook-and-other-omniauth-schemes-without-email-addresses/)
end
