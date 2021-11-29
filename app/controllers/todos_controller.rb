# todos_controller.rb
class TodosController < ApplicationController
    skip_before_action:verify_authenticity_token
    
    def index
      render plain:  Todo.to_displayable_view_list
    end

    def show
      id = params[:id]
      render plain:  Todo.show_single(id)
    end

    def create
      todo_text = params[:todo_text]
      due_date = params[:due_date]
      new_todo = Todo.create!(
        todo_text:todo_text,
        due_date:due_date,
        completed:false
      )
      render plain:  "New task '#{todo_text}' created, Task id: #{new_todo.id}"
    end

    def update
      id = params[:id]
      completed = params[:completed]
      todo = Todo.find(id)
      todo.save! 
      render plain:  "Task #{todo.id}: #{todo.todo_text} marked completed successfully!"
    end
  end