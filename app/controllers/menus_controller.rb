class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @menus = Menu.where("DATE(pick_up) > ?", Date.today).near('Brussels')
  end

  def show

  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id
    @menu.save
    redirect_to menus_path
  end

  def edit
  end

  def update
    @menu.update(menu_params)
    redirect_to menus_path
  end

  def destroy
    @menu.destroy
    redirect_to menus_path
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:name, :description, :price, :address, :pick_up)
  end
end

