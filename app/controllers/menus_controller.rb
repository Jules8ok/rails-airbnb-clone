class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index
  # GET /chefs
  # GET /chefs.json
  def index
    @menus = Menu.all
  end

  # GET /chefs/1
  # GET /chefs/1.json
  def show
  end

  # GET /chefs/new
  def new
    @menu = Menu.new
  end

  # GET /chefs/1/edit
  def edit
  end

  # POST /chefs
  # POST /chefs.json
  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @cmenu, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chefs/1
  # PATCH/PUT /chefs/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:name, :description, :price)
    end
end
