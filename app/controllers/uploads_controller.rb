class UploadsController < ApplicationController
  before_action :set_upload, only: [:destroy, :update]

  #GET /uploads
  def index
    @uploads = Upload.all
  end

  # POST /uploads
  def create
    
    # test for recaptcha success
    if !verify_recaptcha
      flash.delete(:recaptcha_error)
      return redirect_to uploads_url, flash: { :warning => 'Are you a robot? We have our concerns' }
    end
    
    @upload = has_file?(params)
    
    if @upload.save
      redirect_to uploads_url, flash: { :success => 'Upload was saved to disk.' }
    else
      redirect_to uploads_url, flash: { :warning => 'Upload was not saved to disk! Please try again.' }
    end
  end

  # UPDATE /uploads/:id
  def update
    if @upload.update(upload_params)
      flash[:success] = 'Upload was updated successfully.'
      flash.keep(:success)
      respond_to do |format|
        format.js { render js: "window.location = '#{root_path}';" }
        format.html { redirect_to uploads_url }
      end
    else
      flash[:warning] = 'Item update failed! Try again?'
      flash.keep(:warning)
      respond_to do |format|
        format.js { render js: "window.location = '#{root_path}';" }
        format.html { redirect_to uploads_url }
      end
    end
  end

  # DELETE /uploads/:id
  def destroy
    if @upload.destroy
      redirect_to uploads_url, flash: { :success => 'Upload was removed from disk.' }
    else
      redirect_to uploads_url, flash: { :warning => "Something has gone wrong. Try again?" }
    end
  end


  private

    # Make sure we don't get hacked, check all the strong_param sheep for wolves
    def upload_params
      params.permit(:file_name,:file_url,:file_type,:file_size)
    end
    
    # Use callback to prep for :destroy
    def set_upload
      @upload = Upload.find(params[:id])
      rescue
        redirect_to uploads_url, flash: { :warning => "A matching upload was not found on disk!" }
    end
    
    # Test if we're passing in an unprocessed file
    def has_file?(params)
      if params.has_key?(:file)
        object = AmazonService.new(params).punch
        return @upload = Upload.new(object)
      else
        return @upload = Upload.new(upload_params)
      end
    end

end