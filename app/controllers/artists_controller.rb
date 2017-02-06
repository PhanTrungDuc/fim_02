class ArtistsController < ApplicationController 
  load_and_authorize_resource only: :show
  load_resource
  load_resource :song, :album
  before_action :type_of_music, only: :index
  before_action :supports, only: :show

  def index
    @search = Artist.search params[:q]
    @artists = @search.result
  end

  def show
  end

  private
  def type_of_music
    @music_types = Artist.type_of_musics.keys
  end

  def supports
    @supports = Supports::Artist.new @song, @album
  end
end
