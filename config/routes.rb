Rails.application.routes.draw do
  get 'reportes/index'

  resources :localities

  resources :institutions

  resources :ayudas

  resources :personas
  get 'personas/:id/listado' => 'personas#listado', as: :listado

  get 'personas/:id/:inst/:muni/:f1/:f2/reporte_municipio' => 'personas#reporte_municipio', as: :reporte_municipio
  get 'personas/:id/reporte_municipio_listado' => 'personas#reporte_municipio_listado', as: :reporte_municipio_listado
  get 'personas/:id/:fecha1/:fecha2/reporte_ayuda' => 'personas#reporte_ayuda', as: :reporte_ayuda
  get 'personas/:fecha1/:fecha2/reporte_totales_sectores' => 'personas#reporte_totales_sectores', as: :reporte_totales_sectores
  get 'personas/:id/:fecha/reporte_por_institucion' => 'personas#reporte_por_institucion', as: :reporte_por_institucion
  get 'personas/:id/:muni/:f1/:f2/:sector/:ayuda/reporte_listado_rango' => 'personas#reporte_listado_rango', as: :reporte_listado_rango

  root 'personas#index'

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
