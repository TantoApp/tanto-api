Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :test_lines
    end
  end
  namespace :api do
    namespace :v1 do
      resources :notes
    end
  end
  namespace :api do
    namespace :v1 do
      resources :external_resources
    end
  end
  namespace :api do
    namespace :v1 do
      resources :test_case_requirements
    end
  end
  namespace :api do
    namespace :v1 do
      resources :tests
    end
  end
  namespace :api do
    namespace :v1 do
      resources :test_cases
    end
  end
  namespace :api do
    namespace :v1 do
      resources :projects
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
