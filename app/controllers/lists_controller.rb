class ListsController < ApplicationController
  before_action :find_list, only: [:show, :edit, :update, :destroy]
  def index
    @lists = current_user.lists.all
  end

  def show
    @items = @list.items
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      # ListItem.lists <<(list_id: @list)
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    if @list.destroy
      redirect_to list_path
    else
      render :show
    end
    
  end

  private

  def list_params
    params.require(:list).permit(:name, :description, :number_of_likes, :list_items)
  end

  def find_list
    @list = current_user.lists.where(id: params[:id]).first
  end
end