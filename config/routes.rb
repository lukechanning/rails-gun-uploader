Rails.application.routes.draw do
    # Rooted my rails app, bro
    root 'uploads#index'
    ### Uploads Routes ###
    get 'uploads' => 'uploads#index'            # Basic GETter
    get 'uploads/new' => 'uploads#new'          # Route to Form Adder
    post 'uploads' => 'uploads#create'          # CREATE Route
    post 'uploads/send' => 'uploads#punch'      # PUNCH file to S3
    delete 'uploads' => 'uploads#destroy'       # DELETE Route
end
