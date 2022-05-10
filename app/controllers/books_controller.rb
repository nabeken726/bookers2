class BooksController < ApplicationController
    before_action :correct_user, only: [:edit, :update]


  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)

  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] ="You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(@book.id)
    else
    render :edit
    end
    flash[:notice] = "You have updated book successfully."
  end




  private

  def book_params
  params.require(:book).permit(:title,:body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end
