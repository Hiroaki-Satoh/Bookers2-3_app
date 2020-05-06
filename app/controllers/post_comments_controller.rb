class PostCommentsController < ApplicationController
	def create
		# book = Book.find(params[:book_id])
		# comment = PostComment.new(post_comment_params)
		# comment.user_id = current_user.id
		# comment.book_id = book.id
    	@show_book = Book.find(params[:book_id])
    	@book = Book.new
    	@post_comment = @show_book.post_comments.new(post_comment_params)
    	@post_comment.user_id = current_user.id
		if @post_comment.save
			redirect_to book_path(@show_book), notice: "successfully created."
		end
	end

	def destroy
		@show_book = Book.find(params[:book_id])
		@post_comment = current_user.post_comments.find_by(params[:book_comment_id])
		@post_comment.destroy
		redirect_to book_path(@show_book)
	end


	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end
