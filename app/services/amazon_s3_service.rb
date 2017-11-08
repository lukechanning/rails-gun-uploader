class AmazonS3Service
    
    def initialize(params)
        @name = params[:file_name]
        @file = params[:file]
    end
    
    # punch the file through to S3
    def punch
        s3 = Aws::S3::Resource.new(region:'us-west-2')
        obj = s3.bucket(ENV['S3_BUCKET']).object(@name)
        
        begin
            # Upload the file
            obj.upload_file(
              @file.path,
              content_type: MimeMagic.by_path(@file.path).type,
              acl:'public-read'
            )
        rescue => e
            Rails.logger.error { "#{e.message} #{e.backtrace.join("\n")}" }
            return false
        end
        
        # Create an object for the upload
        return upload = {
          file_name: obj.key,
          file_url: obj.public_url,
          file_type: obj.content_type,
          file_size: obj.size
        }
        
    end
end