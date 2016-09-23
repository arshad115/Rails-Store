Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  mount Spree::Core::Engine, at: '/'
  Spree::Core::Engine.routes.draw do
    get "/about" => "home#about"
    get "/terms" => "home#terms"
    get "/privacy" => "home#privacy"
    
  end
end
