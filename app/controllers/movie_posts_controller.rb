class MoviePostsController < ApplicationController
  # ! moviesテーブルのデータを取得するメソッド
  def index
    # * 更新時間が現在時間に近い順に並び替えて取得
    @movies = Movie.all.order(updated_at: "DESC")
  end

  # ! 投稿フォームを表示するメソッド
  def new
    # * form_withで使用するためインスタンス化
    @movie = Movie.new
  end

  # ! 投稿するメソッド
  def create
    # * 投稿時にバインドするパラメータの設定
    @movie = Movie.new(movies_params)

    # * 投稿に成功したらリダイレクト、失敗したらエラーを出力する
    if @movie.save
      redirect_to "/movie", notice: "正常にアップロードされました！"
    else
      render "/movie/new", status: :unprocessable_entity
    end
  end

  # ! 投稿の詳細情報を表示するメソッド
  def show
    # * urlパラメータから投稿IDを取得
    @movie = Movie.find(params[:id])
  end

  # ! 編集フォームを表示するメソッド
  def edit
    # * urlパラメータから投稿IDを取得
    @movie = Movie.find(params[:id])
  end

  # ! 投稿を更新するメソッド
  def update
    # * urlパラメータから投稿IDを取得
    @movie = Movie.find(params[:id])

    # * 更新に成功したらリダイレクト、失敗したらエラーメッセージを出力する
    if @movie.update(movies_params)
      redirect_to "/movie/show/#{@movie.id}", notice: "内容の更新が正常に行われました！"
    else
      render "/movie/new", status: :unprocessable_entity
    end
  end

  # ! 投稿を削除するメソッド
  def delete
    # * urlパラメータから投稿IDを取得
    @movie = Movie.find(params[:id])

    # * 削除に成功したらリダイレクト、失敗したらエラーメッセージを出力する
    if @movie.destroy
      redirect_to "/movie", notice: "動画の削除が正常に行われました！"
    else
      redirect_to "/movie", error: "動画の削除の際にエラーが発生しました！"
    end
  end

  # ! 投稿一覧を検索する
  def search
    # * like文でテーブルに検索をかける
    if @search_movies = Movie.where("tag LIKE ?", "%#{params[:keyword]}%")
      flash.now[:notice] = "検索結果の取得が正常に行われました！"
    else
      redirect_to "/movie", error: "検索結果の取得の際にエラーが発生しました！"
    end
  end

  # ! private は自クラス内のみで参照できる
  private

  # ! 投稿を投稿、更新する時のパラメータ
  def movies_params
    params.require(:movie).permit(:title, :contents, :movie, :tag)
  end
end
