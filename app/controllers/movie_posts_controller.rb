class MoviePostsController < ApplicationController
  def index
    @movies = Movie.all.order(updated_at: "DESC")
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

  # 詳細ページ
  def show
    @movie = Movie.find(params[:id])
  end

  # 更新する
  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movies_params)
      redirect_to "/movie/show/#{@movie.id}", notice: "更新に成功"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    @movie = Movie.find(params[:id])

    if @movie.destroy
      redirect_to "/movie", notice: "削除に成功"
    else
      redirect_to "/movie", error: "削除に失敗"
    end
  end

  private

  def movies_params
    params.require(:movie).permit(:title, :contents, :movie, :tag)
  end
end
