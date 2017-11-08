Rails.application.routes.draw do
    # Rooted my rails app, bro
    root 'uploads#index'
    ### Uploads Routes ###
    get 'uploads', to: 'uploads#index'                                      # Basic GETter
    get 'uploads/new', to: 'uploads#new'                                    # Route to Form Adder
    post 'uploads', to: 'uploads#create'                                    # CREATE Route
    delete 'uploads/:id', to: 'uploads#destroy', as: :upload_delete         # DELETE Route
end
