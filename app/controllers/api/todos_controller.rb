class Api::TodosController < ApplicationController
	respond_to :json

	def index
		@todos = Todo.all
		respond_with :api, @todos
	end

	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			respond_with :api, @todo
		else
			respond_with :api, @todo.errors, status: 422
		end
	end

	def show
		@todo = Todo.find(params[:id])
		respond_with :api, @todo
	end

	private
	def todo_params
		params.require(:todo).permit(:title)
	end
end