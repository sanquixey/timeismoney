class ConnectionsController < WebsocketRails::BaseController

  def open
    # store time
    connection_store[:start_time] = Time.now
  end

  def close
    binding.pry
    # calculate seconds elapsed
    seconds_connected = (Time.now - connection_store[:start_time]).round

    # charge customer
    Braintree::Transaction.sale(
      :customer_id => session[:braintree_customer_id],
      :amount => cents_to_string(seconds_connected)
    )

    # clear the customer id to avoid unintended charges
    session[:braintree_customer_id] = nil
  end

  private
  def cents_to_string(cents)
    p '%.2f' % (cents/100.0)
  end

end
