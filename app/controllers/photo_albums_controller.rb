class PhotoAlbumsController < ApplicationController

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

    def update 
        @photo_album.update(photo_album_params)

        redirect_to photo_albums_path
    end

    def destroy 
        @photo_album.destroy
        redirect_to photo_albums_path
    end

    private

    def photo_album_params
        params.require(:photo_album).permit(:title, :photos)
    end
    
end
