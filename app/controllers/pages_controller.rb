class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home, :chefs]
  def home
  end
end
 