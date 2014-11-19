class Todo < ActiveRecord::Base
	validates :title, presence: true

	has_many(
		:comments,
		class_name: "TodoComment",
		foreign_key: :todo_id,
		primary_key: :id
	)
end
