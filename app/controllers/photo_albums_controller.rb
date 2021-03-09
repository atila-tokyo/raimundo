class PhotoAlbumsController < ApplicationController

    def index
        @photoalbums = policy_scope(PhotoAlbum).order(created_at: :desc)
    end

    def new
        @photoalbum = PhotoAlbums.new
        authorize @photoalbums
    end

    def create 
        @photoalbum = PhotoAlbums.new(photo_album_params)
        authorize @photoalbum

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
        params.require(:photo_album).permit(:photo_galery)
    end
    
end
