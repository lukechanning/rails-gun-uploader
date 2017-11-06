class UploadsController < ApplicationController

  #GET /uploads
  def index
    @uploads = Upload.all
  end

  # POST /uploads
  def create
    @upload = Upload.new(upload_params)
    respond_to do |format|
      if @upload.save
        format.html { redirect_to uploads_url, status: :created, notice: 'Upload was saved to disk.' }
      else
        format.html { redirect_to uploads_url, status: :bad_request, notice: 'Upload was not saved to disk! Please try again.' }
      end
    end
  end

  # DELETE /uploads/1
  def destroy
    @upload = Upload.find_by_id(params[:id])
    
    return redirect_to uploads_url, status: :not_found, notice: 'Upload was not found on disk!' unless @upload
    
    respond_to do |format|
      if @upload.destroy
        format.html { redirect_to uploads_url, status: :ok, notice: 'Upload was removed from disk.' }
      else
        format.html { redirect_to uploads_url, status: :internal_server_error, notice: 'Something went wrong, please try again' }
      end
    end
  end

  private

    # Make sure we don't get hacked, check all the strong_param sheep for wolves
    def upload_params
      params.permit(:file_name,:file_url,:file_type,:file_size)
    end

end