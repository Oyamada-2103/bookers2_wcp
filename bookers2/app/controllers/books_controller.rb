class BooksController < ApplicationController

  # def new
  #   @book = Book.new
  # end
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = 1 #（要編集）このコマンドがないと投稿しても反映されない
    @books = Book.all
    @book.save
    redirect_to books_path
  end

  def show
    # @books = Book.all
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id) # @の有無で結果が変わる理由がわからん
  end

  # 投稿データのストロングパラメータ
  private
    def book_params
      params.require(:book).permit(:title, :opinion)
    end


end
