require 'rails_helper'

RSpec.describe UploadsController, type: :controller do
    
    #test GET /uploads route
    describe 'GET /uploads' do
        
        it 'should pass to uploads@index method' do
            should route(:get, '/uploads').to(action: 'index')
        end
        
    end
    
    #test retrieval of template and display of data
    describe 'GET template view and make sure we have data' do
    
        let(:uploaded){ FactoryBot.create(:upload) }
        before { get :index }
        
        it 'should get the :index and render template' do 
            should render_template('index')
        end
        
        it 'should match our created data' do
            expect(assigns(:uploads)).to eq([uploaded])
        end
        
    end
    
end
