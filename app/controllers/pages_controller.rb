class PagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home, :menus]
  def home
    @skip_it = true;
  end

end

