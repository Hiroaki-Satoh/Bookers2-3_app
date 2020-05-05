class PostCommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		comment = PostComment.new(post_comment_params)
		comment.user_id = current_user.id
		comment.book_id = book.id
		comment.save
		redirect_to book_path(book)
	end

	def destroy
		book = Book.find(params[:book_id])
		#削除対象のコメントを探して取得
		comment = current_user.post_comments.find_by(params[:book_comment_id])
		comment.destroy
		redirect_to book_path(book)
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end
