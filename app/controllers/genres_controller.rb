class GenresController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @genres = []
    @genres_list = Genre.all
    render json: @genres_list, each_serializer: GenreSerializer
  end
end
