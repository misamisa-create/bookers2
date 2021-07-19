class BooksController < ApplicationController

  def index
    @books=Book.all
    @book=Book.new

  end

  def show
    @show_book=Book.find(params[:id])
    @book=Book.new

  end

  def edit
    @show_book=Book.find(params[:id])
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @show_book=Book.find(params[:id])
    @show_book.update(book_params)
    redirect_to book_path(@show_book.id)
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:intro)
  end

  def book_params
    params.require(:book).permit(:title,:opinion)
  end

end
