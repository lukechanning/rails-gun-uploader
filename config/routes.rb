Rails.application.routes.draw do
    # Rooted my rails app
    #root 'upload#index'

    # Uploads Routes
    get 'uploads' => 'uploads#index'
    
end
