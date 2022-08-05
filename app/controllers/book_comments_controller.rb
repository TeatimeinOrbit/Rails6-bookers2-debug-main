class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, { only: [:create, :destroy] }

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comments_params)
    comment.book_id = book.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
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
    @book = Book.find_by(id: params[:id])
    return unless @book.user_id != current_user.id
    redirect_to books_path
  end


end
