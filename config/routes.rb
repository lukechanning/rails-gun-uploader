Rails.application.routes.draw do
    # Rooted my rails app, bro
    root 'uploads#index'
    ### Uploads Routes ###
    get 'uploads' => 'uploads#index'        # Basic GETter
    get 'uploads/edit' => 'uploads#edit'    # Route to Form Adder
    post 'uploads' => 'uploads#create'      # Add New Route
end
