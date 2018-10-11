class HomeController < ApplicationController
  before_action :require_logged_in
  def index
    respond_to do |format|
      format.html {render :index}
    end
  end
end