require 'rails_helper'

RSpec.describe AmazonS3Service do
    
    describe '.post to S3_BUCKET' do
        file = {
            file_name: 'S3 Spec Test',
            file: File.new(Rails.root + 'public/logo.png')
        }
        
        it 'is uploaded to S3' do
            obj = AmazonS3Service.new(file).punch
            expect(obj).to include(:file_type,:file_name,:file_url,:file_size)
        end
    end
    
end