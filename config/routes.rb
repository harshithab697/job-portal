Rails.application.routes.draw do

  devise_for :recruiters
  devise_for :job_seekers
  namespace :dashboard do
    
    # authenticated :job_seeker do
    authenticated :recruiter do
      get 'profiles/show'
      get 'profiles/edit'
      patch 'profiles/update'
    end

    authenticated :job_seekers do
      get 'profiles/show'
      get 'profiles/edit'
      patch 'profiles/update'
    end
    #     # resources :jobs, module: "job_seeker", :only => [:show, :index]
    # end

    # authenticated :recruiter do
    #     # resources :jobs, module: "recruiter"
    

      root to: "dashboard#index"
    # end
  end
  get 'welcomes/index'
  get 'welcomes/register' => 'welcomes#register'
  root to: 'welcomes#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
