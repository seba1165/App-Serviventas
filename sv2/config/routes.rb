Rails.application.routes.draw do

  get 'modelos/index'

  get 'modelos/new'

  get 'modelos/create'

  get 'modelos/edit'

  get 'modelos/update'

  get 'modelos/destroy'

  get 'marcas/index'

  get 'marcas/new'

  get 'marcas/create'

  get 'marcas/edit'

  get 'marcas/update'

  get 'marcas/destroy'

  get 'herramientas/index'

  get 'herramientas/new'

  get 'herramientas/create'

  get 'herramientas/edit'

  get 'herramientas/update'

  get 'herramientas/destroy'

  get 'repuestos/index'

  get 'repuestos/new'

  get 'repuestos/create'

  get 'repuestos/edit'

  get 'repuestos/update'

  get 'repuestos/destroy'

  get 'insumos/index'

  get 'insumos/new'

  get 'insumos/create'

  get 'insumos/edit'

  get 'insumos/update'

  get 'insumos/destroy'

  get 'accesorios/index'

  get 'accesorios/new'

  get 'accesorios/create'

  get 'accesorios/edit'

  get 'accesorios/update'

  get 'accesorios/destroy'

  get 'tipo_articulos/index'

  get 'tipo_articulos/new'

  get 'tipo_articulos/edit'

  #resource :carro, only: [:show]
  #resources :det_cot_odc_arts, only: [:create, :update, :destroy]

  get 'articulos/index'

  get 'articulos/new'

  get 'articulos/edit'

  get 'servicio_reparacions/index'

  get 'servicio_reparacions/new'

  get 'servicio_reparacions/edit'

  get 'articulos/index'

  get 'doc_previos/create'
  get 'doc_previos/new'
  get 'doc_previos/index'

  get 'vendedor/inicio'

  #get 'det_cot_odc_arts/index'

  #get 'det_cot_odc_arts/create'

  #get 'det_cot_odc_arts/update'

  #get 'det_cot_odc_arts/destroy'

  #get 'cot_odc_arts/index'

  #get 'cot_odc_arts/new'

  #get 'cot_odc_arts/edit'

  #get 'cot_odc_arts/clienteCot'

  get 'clientes/index'

  get 'clientes/new'

  get 'clientes/edit'

  get 'tipos_cliente/index'

  get 'tipos_cliente/new'

  get 'tipos_cliente/edit'

  get 'empleados/index'

  get 'empleados/new'

  get 'empleados/edit'

  get 'admin/inicio'

  devise_for :empleados, :skip => [:registrations]
  as :empleado do
    get 'empleados/edit' => 'devise/registrations#edit', :as => 'edit_empleado_registration'
    put 'empleados' => 'devise/registrations#update', :as => 'empleado_registration'
  end

  resources :clientes, :except => [:show] do
    collection do
      get :autocomplete_cliente_cliente_correo
    end
  end

  #devise_for :empleados
  resources :empleados, :except => [:show]

  resources :tipos_cliente, :except => [:show]


  #resources :cot_odc_arts, :except => [:show]
  resources :servicio_reparacions, :except => [:show]

  resources :cot_odc_arts, :except => [:show]

  resources :doc_previos, :except => [:show]

  resources :articulos, :except => [:show]
  resources :accesorios, :except => [:show]
  resources :insumos, :except => [:show]
  resources :repuestos, :except => [:show]
  resources :herramientas, :except => [:show]

  resources :tipo_articulos, :except => [:show]

  resources :marcas, :except => [:show]
  resources :modelos, :except => [:show]

  #devise_for :empleados, :controllers => { :registrations => "registrations" } , :skip => [:registrations]
  #as :empleado do
  #  get 'empleado/edit' => 'devise/registrations#edit', :as => 'edit_empleado_registration'
  #  put 'empleados' => 'devise/registrations#update', :as => 'empleado_registration'
  #end

  post "clientes/del/:id" => 'clientes#elimCliente' , as: :elimCliente
  post "empleado/del/:id" => 'admin#elimUsr' , as: :elimUsr
  #post "cot_odc_arts/del/:id" => 'cot_odc_arts#elimCotODCArt' , as: :elimCotODCArt
  post "tipos_cliente/del/:id" => 'tipos_cliente#elimTipoCliente', as: :elimTipoCliente
  post "doc_previos/del/:id" => 'doc_previos#elimDocPrevio', as: :elimDocPrevio
  post "servicio_reparacions/del/:id" => 'servicio_reparacions#elimSR', as: :elimSR
  post "articulos/del/:id" => 'articulos#elimArt', as: :elimArt
  post "tipo_articulos/del/:id" => 'tipo_articulos#elimTipoArt', as: :elimTipoArt
  post "marcas/del/:id" => 'marcas#elimMarca', as: :elimMarca
  post "accesorios/del/:id" => 'accesorios#elimAcc', as: :elimAcc
  post "herramientas/del/:id" => 'herramientas#elimHerr', as: :elimHerr
  post "insumos/del/:id" => 'insumos#elimIns', as: :elimIns
  post "repuestos/del/:id" => 'repuestos#elimRepu', as: :elimRepu
  post "modelos/del/:id" => 'modelos#elimModelo', as: :elimModelo


  get 'admin/parametro' => 'errors#construccion'

  get 'admin/registro'

  get 'vehiculos' => 'errors#construccion'

  get 'ventas' => 'errors#construccion'

  get 'precioArt' => 'errors#construccion'
  get 'precioServ' => 'errors#construccion'

  get 'admin/ordComp' => 'errors#construccion'

  get 'admin/nuevaOC' => 'errors#construccion'

  get 'admin/anularOC' => 'errors#construccion'

  get 'admin/aprobOC' => 'errors#construccion'

  get 'admin/abrirOC' => 'errors#construccion'

  get 'admin/OT' => 'errors#construccion'

  get 'admin/anularOT' => 'errors#construccion'

  get 'admin/editarOT' => 'errors#construccion'

  get 'admin/finOT' => 'errors#construccion'

  get 'admin/notVent' => 'errors#construccion'

  get 'admin/genNV' => 'errors#construccion'

  get 'admin/pagoNV' => 'errors#construccion'

  get 'admin/articulo'

  get 'admin/servicio' => 'errors#construccion'

  get 'admin/servEdRep' => 'errors#construccion'
  
  get 'admin/servEdInstal' => 'errors#construccion'
  
  get 'vendedor/nuevaOC' => 'errors#construccion'

  get 'vendedor/anularOC' => 'errors#construccion'

  get 'vendedor/aprobarOC' => 'errors#construccion'

  get 'vendedor/abrirOC' => 'errors#construccion'

  get 'vendedor/ordComp' => 'errors#construccion'

  get 'vendedor/nuevaCot'

  get 'vendedor/anular' => 'errors#construccion'

  get 'vendedor/aprobar' => 'errors#construccion'

  get 'vendedor/abrir' => 'errors#construccion'

  get 'vendedor/cotizacion' => 'errors#construccion'

  get 'vendedor/notVen' => 'errors#construccion'

  get 'vendedor/clientes' => 'errors#construccion'

  get 'vendedor/vehiculos' => 'errors#construccion'

  root to: 'welcome#home', constraints: lambda { |request| !request.env['warden'].user }


  root to: 'admin#inicio', as: 'admin_root',
       constraints: lambda { |request| request.env['warden'].user.administrador? }

  root to: 'vendedor#inicio', as: 'vendedor_root',
       constraints: lambda { |request| request.env['warden'].user.vendedor? }

  root to: 'otros#inicio', as: 'jedeDeVentas_root',
       constraints: lambda { |request| request.env['warden'].user.jefeDeVentas? }
  root to: 'otros#inicio', as: 'jefeDeServicios_root',
       constraints: lambda { |request| request.env['warden'].user.jefeDeServicios? }
  root to: 'otros#inicio', as: 'jefeDeBodega_root',
       constraints: lambda { |request| request.env['warden'].user.jefeDeBodega? }

  #get 'welcome/home'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
 #root 'welcome#home'

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

  get "*any", via: :all, to: "errors#not_found"
end
