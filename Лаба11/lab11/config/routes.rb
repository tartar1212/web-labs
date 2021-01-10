Rails.application.routes.draw do
  root 'automorphs#input'
  get 'automorphs/input'
  get 'automorphs/view'
  get 'automorphs/cached', :defaults => { :format => 'xml' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
