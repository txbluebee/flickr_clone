class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
    @image_owner = User.find(@image.user_id)
    @current_user = current_user
  end

  def new
    @user = current_user
    @image = @user.images.new
  end

  def create
    @user = current_user
    @image = @user.images.new(image_params)
    if @image.save
      redirect_to images_path,  notice: "image successfully added!"
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
    @user = current_user
  end

  def update
    @image = Image.find(params[:id])
    @user = current_user
    if @image.update(image_params)
      redirect_to image_path(@image), notice: "Image successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])

    @image.destroy
    redirect_to images_path
  end

  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def image_params
    params.require(:image).permit(:attachment, :title, :user_id)
  end
end
