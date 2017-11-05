require 'rails_helper'

RSpec.describe UploadsController, type: :controller do
    
    describe 'GET /uploads' do
        it 'passes to uploads@index method' do
            should route(:get, '/').to(action: 'index')
        end
    end
    
    describe 'GET template view and data' do
        let(:uploaded){ FactoryBot.create(:upload) }
        before { get :index }
        
        it 'routes to :index and renders template' do 
            should render_template('index')
        end
        
        it 'matches our created data' do
            expect(assigns(:uploads)).to eq([uploaded])
        end
    end
    
end
