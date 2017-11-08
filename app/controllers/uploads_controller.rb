class UploadsController < ApplicationController

  #GET /uploads
  def index
    @uploads = Upload.all
  end

  # POST /uploads
  def create
    @upload = Upload.new(upload_params)
    
    if @upload.save
      redirect_to uploads_url, notice: 'Upload was saved to disk.'
    else
      render status: :bad_request, html: { notice: 'Upload was not saved to disk! Please try again.' }
    end
  end
  
  # POST /uploads/send
  def punch
    s3 = Aws::S3::Resource.new(region:'us-west-2')
    obj = s3.bucket(ENV['S3_BUCKET']).object(params[:file_name])
    
    # Upload the file
    obj.upload_file(
      params[:file].path,
      content_type: params[:file].content_type,
      acl:'public-read'
    )

    # Create an object for the upload
    @upload = Upload.new(
      file_name: obj.key,
      file_url: obj.public_url,
      file_type: obj.content_type,
      file_size: obj.size
    )
    
    @upload.save
    
    redirect_to uploads_path, notice: 'Upload was saved to disk.'
    
  end

  # DELETE /uploads/1
  def destroy
    @upload = Upload.find_by_id(params[:id])
    
    return render status: :not_found, html: { notice: "A matching upload was not found on disk!" } unless @upload
    
    if @upload.destroy
      redirect_to uploads_url, notice: 'Upload was removed from disk.'
    else
      render status: :internal_server_error, html: { notice: "Something has gone wrong, please try again" }
    end
  end

  private

    # Make sure we don't get hacked, check all the strong_param sheep for wolves
    def upload_params
      params.permit(:file_name,:file_url,:file_type,:file_size)
    end

end