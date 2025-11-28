class TodoItemsController < ApplicationController
  before_action :set_todo_item, only: [ :edit, :update, :destroy, :toggle ]

  def index
    @todo_items = TodoItem.order(created_at: :desc)
  end

  def new
    @todo_item = TodoItem.new
  end

  def create
    @todo_item = TodoItem.new(todo_item_params)

    if @todo_item.save
      redirect_to todo_items_path, notice: "Todo item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @todo_item.update(todo_item_params)
      redirect_to todo_items_path, notice: "Todo item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo_item.destroy
    redirect_to todo_items_path, notice: "Todo item was successfully deleted."
  end

  def toggle
    @todo_item.update(completed: !@todo_item.completed)
    redirect_to todo_items_path
  end

  private

  def set_todo_item
    @todo_item = TodoItem.find(params[:id])
  end

  def todo_item_params
    params.require(:todo_item).permit(:title, :description, :completed)
  end
end
