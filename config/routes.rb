Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  concern :workable do
    resources :work_order_lines
  end

  concern :produceable do
    resources :production_operations
  end
  
  resources :work_orders, concerns: :workable

  resources :work_order_lines, concerns: :produceable

  
  resources :parts, concerns: :workable do
    resources :part_operations, concerns: :produceable
  end


end
