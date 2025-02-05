class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_sold_out, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def check_sold_out
    @item = Item.find(params[:item_id])
    return unless @item.sold_out? || current_user.id == @item.user_id

    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
