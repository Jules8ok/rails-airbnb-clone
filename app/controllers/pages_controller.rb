class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home, :menus]
  def home
  end
end

