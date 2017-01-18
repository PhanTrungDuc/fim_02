class UsersController < ApplicationController
  load_resource

  def show
    @favorite_songs = @user.list_favorite_songs
      .paginate page: params[:favorite_song_page]
  end
end
