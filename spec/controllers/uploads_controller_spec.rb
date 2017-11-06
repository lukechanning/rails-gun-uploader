require 'rails_helper'

RSpec.describe UploadsController, type: :controller do
    
    describe 'GET #index' do
        let(:uploaded){ FactoryBot.create(:upload) }
        before { get :index }
        
        it 'passes to uploads@index method' do
            should route(:get, '/').to(action: 'index')
        end
        
        it 'renders template' do 
            should render_template('index')
        end
        
        it 'matches our created data' do
            expect(assigns(:uploads)).to eq([uploaded])
        end
    end
    
    describe 'POST #create' do
        context "with valid attributes" do
            
            it "creates a new upload" do
                expect {
                    post :create, params: FactoryBot.attributes_for(:upload)
                }.to change {Upload.all.count}.by(1)
                should respond_with(201)
            end
            
        end
        
        context "without valid attributes" do
            
            it "fails to create new upload" do
                post :create, params: { file_type: 'jpg', file_name: 'Test Failure' }
                should respond_with(400)
            end
            
        end
    end
    
    describe 'DELETE #destroy' do
        context 'with known upload id' do
            before{ @gone = FactoryBot.create(:upload) }
            
            it 'deletes the upload entry' do
                expect {
                    delete :destroy, params: { id: @gone }
                }.to change {Upload.all.count}.by(-1)
                should respond_with(200) 
            end
            
        end
        
        context 'with invalid id' do
            it 'returns 404 error code' do
                delete :destroy, params: { id: 45234689 }
                expect(response).to have_http_status(404)
            end
        end
    end
    
end
