class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :find_list

  def index
    @items = Item.all 
  end

  def show

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      @list.items << @item
      redirect_to list_item_path(@list, @item)
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @item.update(items_params)
      redirect_to list_item_path(@list, @item)
    else
      render :edit
    end
  end

  def destroy
    @list_item = ListItem.where(list_id: @list, item_id: @item)
    if ListItem.destroy(@list_item)
      redirect_to list_path(@list)
    else
      render :show
    end
    
  end

  private

  def items_params
    params.require(:item).permit(:name, :description, :status, :category, :number_of_likes)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def find_list
    @list = current_user.lists.find(params[:list_id])
  end
end

 