class MicropostsController < ApplicationController
	def new
		#not getting invoked
	end
	
	def create
		micropost_params = params.require(:micropost).permit(:content , :user)
		@micropost = Micropost.new(content: params[:micropost][:content] ,user: current_user )
		
		if @micropost.save
			redirect_to current_user
		end 
	end

	def show
		#not getting invoked
	end

end
