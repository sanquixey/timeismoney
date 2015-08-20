class ChargesController < ApplicationController

  def new
    redirect_to root_url unless session[:braintree_customer_id]
  end

end
