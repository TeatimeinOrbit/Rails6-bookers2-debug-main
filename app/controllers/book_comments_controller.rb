class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comments_params)
    comment.book_id = book.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
  end

  def edit
  end

  def update
  end


  private

  def book_comments_params
    params.require(:book_comment).permit(:commet)
  end


end