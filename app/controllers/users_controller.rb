class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
    # kaminariをインストールするとpageメソッドが使用可能に
    @books=@user.books.page(params[:page]).reverse_order
  end
  def edit
  end
end
