class WelcomesController < ApplicationController
  def index
  	# byebug
  	if current_user
  		redirect_to :controller => 'dashboard/dashboard', :action => 'index' 
  	end
  end

  def register
  end
end
