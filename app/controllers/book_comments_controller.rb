class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, { only: [:destroy] }

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comments_params)
    comment.book_id = @book.id
    comment.save
    @book_comment = BookComment.new
  end
    #redirect_back(fallback_location: root_path)


  def destroy
    @book = Book.find(params[:book_id])

    BookComment.find(params[:id]).destroy
    @book_comment = BookComment.new
  end



  def edit
  end

  def update
  end


  private

  def book_comments_params
    params.require(:book_comment).permit(:comment)
  end


  def ensure_correct_user
    @book_comment = BookComment.find_by(id: params[:id])
    return unless @book_comment.user_id != current_user.id
    redirect_to books_path
  end


end
