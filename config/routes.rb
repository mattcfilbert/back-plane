Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :work_orders do
    resources :work_order_lines do
      resources :production_operations
    end
  end

  resources :parts do
    resources :work_order_lines do
      resources :production_operations
    end
    resources :part_operations do
      resources :production_operations
    end
  end
end
