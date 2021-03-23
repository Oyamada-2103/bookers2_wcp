class BooksController < ApplicationController

  # def new
  #   @book = Book.new
  # end
  def index
    @book = Book.new
    @books = Book.all
    
    # @user = User.find(params[:id])
    # @user_id =@book.user.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id #（要編集）このコマンドがないと投稿しても反映されない
    # @book.user_id = current_user.id
    @books = Book.all
    if @book.save
      redirect_to books_path, notice:'Book was successfully created.'
    else
      render :index
    end
  end

  def show
    # @books = Book.all
    @book = Book.find(params[:id])
    
    # @user = User.find(params[:id])
    # @books = @user.books.all


  end

  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    redirect_to books_path, notice:'Book was successfully deleated.'
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id), notice:'Book was successfully updated.'
  end

  # 投稿データのストロングパラメータ
  private
    def book_params
      params.require(:book).permit(:title, :body)
    end


end
