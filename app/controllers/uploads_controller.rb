class UploadsController < ApplicationController
  before_action :set_upload, only: [:create, :destroy]
    
  #GET /uploads
  def index
    @uploads = Upload.all
  end

  # POST /uploads
  def create
    # we'll add code here
  end

  # DELETE /uploads/1
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was removed from disk.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Make sure we don't get hacked, check all the strong_param sheep for wolves
    def upload_params
      params.require(:upload).permit(
          :file_name,
          :file_url,
          :file_type,
          :file_size
        )
    end

end