class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  before_action :check_sold_out, only: [:new, :create, :edit]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :ship_day_id, :price)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_user
    return if current_user.id == @item.user_id

    redirect_to item_path
  end

  def check_sold_out
    return unless @item.sold_out?

    redirect_to root_path
  end
end
