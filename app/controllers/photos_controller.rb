class PhotosController < ApplicationController
	def new
    @photo = Photo.new
  end

  def create
		@user = User.find(session[:user_id])
    @memorial = Memorial.find(params[:memorial_id])
		@photo = Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html do
          @photo.update(uploader: @user, memorial: @memorial)
          redirect_to memorial_path(@memorial), notice: 'Photo was successfully created.'
        end
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new, notice: 'Photo was not uploaded correctly.' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
	end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    @memorial = Memorial.find(params[:memorial_id])
    redirect_to memorial_path(@memorial)
  end

	private
		def photo_params
      params.require(:photo).permit(:memorial_id, :approved, :uploader, :url, :caption, :profile)
    end
end
