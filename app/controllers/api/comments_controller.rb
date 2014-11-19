class Api::CommentsController < ApplicationController
	def index
		@comments = TodoComment.where(todo_id: params[:todo_id])
		render json: @comments
	end

	def create
		@comment = TodoComment.new(comment_params)
		if @comment.save
			render json: @comment
		else
			render json: @comment.errors, status: 422
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :todo_id)
	end
end