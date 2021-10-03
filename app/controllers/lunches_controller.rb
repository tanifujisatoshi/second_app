class LunchesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
# ログインをしていないと給食の新規投稿 編集 削除をするときにログイン画面に遷移させる

  before_action :move_to_index, only: [:edit]
# lunchesコントローラーのeditアクションにリクエストがあった場合はアクションが実行される前にmove_to_indexメソッドが動く

  def index
    @lunches = Lunch.all
  end

  def new
    @lunch = Lunch.new
  end

  def show
    @lunch = Lunch.find(params[:id])
  # 給食の詳細を確認するためにリクエストがビューから送られてくる
  # paramsの中には詳細を確認したい給食のidが入っている
  # そのidの値を取り出すことで詳細を確認したい給食の詳細が@lunchに代入される
    @comment = Comment.new
    @comments = @lunch.comments
# 詳細画面のコメントフォームに入力された内容をcommentコントローラーのshowのcreateアクションに送信したいのでインスタンスを生成して変数に代入している その変数をshow.html.erbのform_withで使っている
# 給食の詳細画面のコメント欄でその給食に紐づく全てのコメントを表示するために@lunch(給食のレコードが入っている)に対してcommentsをつけている(給食のレコードに紐づいたcommentテーブルの情報全てを@commentsに代入している)
  end

  def create
    @lunch = Lunch.new(lunch_params)
  # lunch_paramsのpermitメソッドで指定したカラムの内容でlunchモデルのインスタンスを生成した
   if @lunch.save
       redirect_to root_path
  # 入力した内容で保存できたらトップページに遷移させる
   else  
    render :new
# 入力した内容に不備があった場合は入力した内容が残ったまま投稿画面に遷移させる
   end
  end

  def edit
    @lunch = Lunch.find(params[:id])
# ビューからeditアクションにリクエストがあった場合はparamsの中に編集をしたいidが入ってるのでそのバリューを取り出すためにparams[:id]と記述している
# lunchテーブルにあるレコードを取得してそれをインスタンス変数@lunchに代入している
# 編集画面にはレコード情報が既に入力された状態である
  end

  def update
    @lunch = Lunch.find(params[:id])
# 編集画面のフォームから編集をした投稿のidがparamsとともにコントローラーに送られてくる
# そのidの値をparams[:id]で取り出すことでlunchテーブルのレコードを取得することができる
# それをインスタンス変数@lunchに代入している
    if @lunch.update(lunch_params)
       redirect_to  lunch_path
# paramsのlunchの中にあるキーのバリューを持ってレコードを更新できた場合は 詳細画面に遷移させる
    else
      render :edit
# もし更新ができなかった場合は内容が残ったまま編集画面に遷移させる
    end
  end

  def destroy
    lunch = Lunch.find(params[:id])
# lunchesコントローラーのdestroyアクションにビューからリクエストがあった場合にparamsに入っている削除したい投稿のidの値を取得するためにparams[:id]としている
# そのように記述することでlunchesテーブルからレコードを取得することができる 取得したレコードを変数lunchに代入している 変数lunchはビューで使われないため@をつけていない
    if lunch.destroy
      redirect_to root_path
# レコードが削除できた場合はトップページに遷移させる
    end
  end

  private
  def lunch_params
    params.require(:lunch).permit(:staple_food, :main_dish, :side_dish, :soup, :drink, :other, :image).merge(user_id: current_user.id)
# フォームから送られてくるparamsの中からキーであるlunchを指定してその中からpermitメソッドで指定したカラムだけ保存するようにした
# 誰が投稿したものかをmergeメソッドで指定した
  end 

  def move_to_index
    @lunch = Lunch.find(params[:id])
# ビューからlunchesテーブルのレコードのidが送られてくる
# そのidの値を受け取るためにparams[:id]という記述をしている
# 給食を編集するのに必要な給食のレコードを取得できる
    unless current_user.id == @lunch.user.id
     redirect_to action: :index
    end
# 現在ログインしているユーザーのidと編集をするための給食に紐づいたユーザーのidが異なっていたらlunchesコントローラーのindexアクションのビューに遷移させる
  end
end
