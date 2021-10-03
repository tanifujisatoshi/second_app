class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
# comment_paramsの内容を持ってcommentモデルのインスタンスを生成する
    if @comment.save
      redirect_to  lunch_path(@comment.lunch)
# 
    else
      @lunch = @comment.lunch
      @comments = @lunch.comments
      render "lunches/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, lunch_id: params[:lunch_id])
# コメントフォームから入力された内容がparamsに格納されてcommentsコントローラーに送信される
# paramsの中からcommentのバリューを取り出してその中にあるtextキーを保存することができる
# コメントは誰がしているのかを表すためにcommentsテーブルのuser_idカラムに残す値を現在ログインしているユーザーとしている
# どの給食に対するコメントなのかをcommentsテーブルのlunch_idカラムに残す必要があるのでparamsから送られてくるlunch_idキーのバリューを取り出している
  end

end
