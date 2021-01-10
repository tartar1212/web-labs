Rails.application.routes.draw do
	root 'client#input'
	get 'client/output'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
