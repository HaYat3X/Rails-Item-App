class ImagesController < ApplicationController
  # ! imagsデーブルを全件取得し、viewに返すメソッド
  def index
    # * 全件取得
    @images = Imgae.all
  end

  # ! imageテーブルにデータを登録するフォームを表示するメソッド
  def new
    # * インスタンス化する
    @image = Image.new
  end
end
