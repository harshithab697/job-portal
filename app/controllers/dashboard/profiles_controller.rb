class Dashboard::ProfilesController < ApplicationController
  def show
	end

	def edit
		@current_user = current_user
	
	end

	def update
		respond_to do |format|
			if current_user.update(user_params	)
				format.html {redirect_to current_user, notice: 'your profile is updated successfully.' }
			else
				format.html { render :edit }
	    end 
end
end

private

	def user_params 
		byebug
		params.require(@current_user).permit(:name, :qualification, :skills, :dob, :experience)
  end

	
end
