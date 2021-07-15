class BooksController < ApplicationController

  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @book=Book.find(params[:id])
    # 遷移先がbooks/idにならないのであとで確認する
  end

  def edit
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to book_path(@book.id)
    # 遷移先がbooks/idにならないのであとで確認する
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
  end

  private
  def book_params
    params.require(:book).permit(:title,:opinion)
  end

end
