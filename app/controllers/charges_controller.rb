class ChargesController < ApplicationController

  def new
    redirect_to root_url unless session[:customer]


  end

  def create
  end
end
