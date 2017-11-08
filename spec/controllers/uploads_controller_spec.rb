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
                expect(flash[:success]).to be_present
            end
            
        end
        
        context "without valid attributes" do
            
            it "fails to create new upload" do
                post :create, params: { file_type: 'jpg', file_name: 'Test Failure' }
                expect(flash[:warning]).to be_present
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
                expect(flash[:success]).to be_present
            end
            
        end
        
        context 'with invalid id' do
            it 'cannot find matching upload' do
                delete :destroy, params: { id: 45234689 }
                expect(flash[:warning]).to be_present
            end
        end
    end
    
end
