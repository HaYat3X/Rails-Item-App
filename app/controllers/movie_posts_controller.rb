class MoviePostsController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movies_params)

    if @movie.save
      redirect_to "/movie", notice: "投稿に成功"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def movies_params
    params.require(:movie).permit(:title, :contents, :movie, :tag)
  end
end
