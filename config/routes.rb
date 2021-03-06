Rails.application.routes.draw do
  resources :tutorials
  resources :posts ,except: :show
  devise_for :admins
  resources :medals do
    put :sort, on: :collection
  end
  resources :students  do
    collection do
      post 'export' => 'students#export'
      post 'import' => 'students#import'
    end
    resources :projects
  end
  post 'students/:id/add_medal/:m_id' => 'students#add_medal' ,as: 'add_medal'

  post 'projects/import' => 'projects#import', as: 'import_projects'
  post 'projects/export' => 'projects#export', as: 'export_projects'
  delete 'students/:id/remove_medal/:m_id' => 'students#remove_medal' ,as: 'remove_medal'
  get 'upload' => 'welcome#upload' ,as: 'upload'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
