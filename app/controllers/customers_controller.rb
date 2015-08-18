class CustomersController < ApplicationController
  def new
    # generate client token
    @client_token = Braintree::ClientToken.generate
    @customer = Customer.new
  end

  def create
    response = Braintree::Customer.create(
      :payment_method_nonce => params[:payment_method_nonce]
    )

    if response.success?
      # store customer id in session
      session[:customer] = response.customer.id
      redirect_to new_charge_path
    else
      flash[:danger] = "Transaction error: #{response.transaction.processor_response_text}"
      redirect_to root_url
    end
  end
end
