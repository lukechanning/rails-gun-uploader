class UploadsController < ApplicationController

  #GET /uploads
  def index
    @uploads = Upload.all
  end

  # POST /uploads
  def create
    
    @upload = has_file?(params)
    
    if @upload.save
      redirect_to uploads_url, notice: 'Upload was saved to disk.'
    else
      render status: :bad_request, html: { notice: 'Upload was not saved to disk! Please try again.' }
    end
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
    
    # Test if we're passing in an unprocessed file
    def has_file?(params)
      if params.has_key?(:file)
        object = AmazonS3Service.new(params).punch
        return @upload = Upload.new(object)
      else
        return @upload = Upload.new(upload_params)
      end
    end

end