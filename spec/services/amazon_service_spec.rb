require 'rails_helper'

RSpec.describe AmazonService do
    
    describe '.post to S3_BUCKET' do
        file = {
            file_name: 'S3 Spec Test',
            file: File.new(Rails.root + 'public/logo.png')
        }
        
        it 'is uploaded to S3' do
            obj = AmazonService.new(file).punch
            expect(obj).to include(:file_type,:file_name,:file_url,:file_size)
        end
    end
    
end