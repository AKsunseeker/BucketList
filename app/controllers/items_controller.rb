class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :find_list, only: [:update]
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
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @item.update(items_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path
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
    @list = List.find(@item)
  end
end

 