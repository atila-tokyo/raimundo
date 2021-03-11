class PhotoAlbumsController < ApplicationController
  before_action :set_photo_album, only: %i[show edit update destroy delete_image_attachment]
  def index
    @photoalbums = policy_scope(PhotoAlbum).order(created_at: :desc)
  end

  def new
    @photoalbum = PhotoAlbum.new
    authorize @photoalbum
  end

  def create
    @photoalbum = PhotoAlbum.new(photo_album_params)
    authorize @photoalbum

    @photoalbum.user = current_user
    if @photoalbum.save
      redirect_to photo_albums_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @photoalbum.update(photo_album_params)

    redirect_to photo_album_path(@photoalbum)
  end

  def show
    @photoalbum = PhotoAlbum.find(params[:id])
    authorize @photoalbum
  end

  def destroy
    @photoalbum.destroy
    redirect_to photo_albums_path
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:format])

    @image.purge
    redirect_to photo_album_path(@photoalbum)
  end

  private

  def photo_album_params
    params.require(:photo_album).permit(:title, photos: [])
  end

  def set_photo_album
    @photoalbum = PhotoAlbum.find(params[:id])
    authorize @photoalbum
  end
end
