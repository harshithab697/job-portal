class Dashboard::ProfilesController < ApplicationController
  def show
	end

	def edit
		@current_user = current_user
		#@current_user = current_user.edit(current_user_params)
	end

	def update
		respond_to do |format|
			if current_user.update(current_user_params)
				format.html {redirect_to @current_user, notice: 'your profile is updated successfully.' }
			else
				format.html { render :edit }
	    end 
  end
end

private

	def current_user_params 
		params.require(:current_user).permit(:name, :qualification, :skills, :dob, :experience, :cname, :description, :clocation, :csize)
  end
	
end