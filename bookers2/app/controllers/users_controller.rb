# userページのコントローラー

class UsersController < ApplicationController

  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id), notice:'You have updated user successfully.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
