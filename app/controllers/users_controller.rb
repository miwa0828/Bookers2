class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  # def create
  #   @book = Book.new(book_params)
  #   book.save
  #   redirect_to books_path
  # end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
      flash[:success]='You have updated user successfully.'
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
    redirect_to user_path(current_user)
    end
  end
end