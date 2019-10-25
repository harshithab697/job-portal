Rails.application.routes.draw do

	devise_for :recruiters
  devise_for :job_seekers
  namespace :dashboard do
    # authenticated :job_seeker do
    #     # resources :jobs, module: "job_seeker", :only => [:show, :index]
    # end

    # authenticated :recruiter do
    #     # resources :jobs, module: "recruiter"
    # end

    root to: "dashboard#index"
  end
  get 'welcomes/index'
  get 'welcomes/register' => 'welcomes#register'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcomes#index'
end
