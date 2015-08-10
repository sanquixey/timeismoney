class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    # generate client token
    @client_token = Braintree::ClientToken.generate
  end

  def authorize
    customer = Braintree::Customer.create(
      :payment_method_nonce => params[:payment_method_nonce]
    )

    session[:customer] = customer
  end

end
