class AdminController < ApplicationController
  def index
    @enquiries = Enquiry.reverse_chron_order.first(10)
  end
end
