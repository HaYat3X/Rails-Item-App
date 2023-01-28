class ImagesController < ApplicationController
  # ! imagsデーブルを全件取得し、viewに返すメソッド
  def index
    # * 全件取得
    @images = Imgae.all
  end

  # ! imageテーブルにデータを登録するフォームを表示するメソッド
  def new
    # * インスタンス化する
    @image = Imgae.new
  end

  # ! imageテーブルにデータ登録
  def create
    @image = Imgae.new(image_params)

    # 投稿に成功したらリダイレクト
    if @image.save
      redirect_to "/", notice: "お気に入り画像が投稿されました！"
    else
      # 投稿に失敗したらエラーを吐く rails7ばstatus: :unprocessable_entityがいる
      render :new, status: :unprocessable_entity, notice: "投稿に失敗しました。"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # images_dbに関連付けるパラメータ
  def image_params
    params.require(:imgae).permit(:title, :image, :contents, :tag)
  end
end
