class PhotoAlbumsController < ApplicationController

    def index
        @photo_albums = policy_scope(PhotoAlbums).order(created_at: :desc)
    end

    def new
        photo_album = PhotoAlbums.new
        authorize @photo_albums
    end

    def create 
        @photo_album = PhotoAlbums.new(photo_album_params)
        @authorize @photo_album

        if @photo_album.save
            redirect_to photo_albums_path
        else
            render :new
        end
    end

    def update 
        @photo_album.update(photo_album_params)
    end

    private

    def photo_album_params
        params.require(:photo_album).permit(:photo_galery)
    end
    
end
